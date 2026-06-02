-- ============================================================
-- QA Portfolio: Database Validation Queries
-- Application: Northwind Sample Database (SQLite/MySQL)
-- [SAMPLE ARTIFACT] — Created for QA portfolio demonstration
-- Author: Kevin Trimboli | QA Engineer
-- ============================================================
-- HOW TO USE:
--   1. Load the Northwind sample database
--   2. Run each query block individually
--   3. Compare Actual Output vs Expected Output comments
--   4. Any rows returned by ANOMALY queries = defect to log
-- ============================================================


-- ============================================================
-- SECTION 1: NULL CHECKS — Required fields must not be null
-- ============================================================

-- QUERY: DQ-001
-- PURPOSE: Find products with no product name (data entry defect)
-- EXPECTED: 0 rows returned (all products must have a name)
-- FAILURE CONDITION: Any rows returned = null name in products table
SELECT ProductID, ProductName, SupplierID
FROM Products
WHERE ProductName IS NULL OR TRIM(ProductName) = '';

-- QUERY: DQ-002
-- PURPOSE: Find customers with no contact name or company name
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: A customer with no identifying information is unusable in CRM
SELECT CustomerID, CompanyName, ContactName, ContactTitle
FROM Customers
WHERE CompanyName IS NULL
   OR ContactName IS NULL;

-- QUERY: DQ-003
-- PURPOSE: Find orders missing a customer reference
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: Orphaned orders with no customer are a referential integrity violation
SELECT OrderID, CustomerID, OrderDate, EmployeeID
FROM Orders
WHERE CustomerID IS NULL;

-- QUERY: DQ-004
-- PURPOSE: Find order line items with no quantity or unit price
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: A sale with no price/quantity cannot be invoiced
SELECT OrderID, ProductID, Quantity, UnitPrice
FROM [Order Details]
WHERE Quantity IS NULL
   OR UnitPrice IS NULL
   OR Quantity <= 0
   OR UnitPrice < 0;


-- ============================================================
-- SECTION 2: DUPLICATE CHECKS — Unique constraints validation
-- ============================================================

-- QUERY: DQ-005
-- PURPOSE: Detect duplicate customer records (same company + contact)
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: Duplicate customers corrupt CRM data and cause billing issues
SELECT CompanyName, ContactName, COUNT(*) AS DuplicateCount
FROM Customers
GROUP BY CompanyName, ContactName
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;

-- QUERY: DQ-006
-- PURPOSE: Detect duplicate products (same name + supplier)
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: Duplicate products lead to split inventory and double-counting
SELECT ProductName, SupplierID, COUNT(*) AS DuplicateCount
FROM Products
GROUP BY ProductName, SupplierID
HAVING COUNT(*) > 1;

-- QUERY: DQ-007
-- PURPOSE: Detect duplicate order line items (same order + same product)
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: Same product appearing twice in one order inflates totals
SELECT OrderID, ProductID, COUNT(*) AS DuplicateCount
FROM [Order Details]
GROUP BY OrderID, ProductID
HAVING COUNT(*) > 1;


-- ============================================================
-- SECTION 3: REFERENTIAL INTEGRITY CHECKS
-- ============================================================

-- QUERY: DQ-008
-- PURPOSE: Find order details referencing products that no longer exist
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: Orphaned order details — product was deleted without cascade
SELECT od.OrderID, od.ProductID, od.Quantity, od.UnitPrice
FROM [Order Details] od
LEFT JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductID IS NULL;

-- QUERY: DQ-009
-- PURPOSE: Find orders referencing customers that no longer exist
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: Customer was deleted without first reassigning or archiving orders
SELECT o.OrderID, o.CustomerID, o.OrderDate
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;

-- QUERY: DQ-010
-- PURPOSE: Find orders referencing employees that no longer exist
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: Employee terminated but their orders have no handler
SELECT o.OrderID, o.EmployeeID, o.OrderDate
FROM Orders o
LEFT JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE e.EmployeeID IS NULL;


-- ============================================================
-- SECTION 4: INVENTORY VALIDATION
-- ============================================================

-- QUERY: DQ-011
-- PURPOSE: Find products with critically low or zero inventory
-- EXPECTED: Review result — any stock <= reorder level needs attention
-- FAILURE CONDITION: If stock = 0 and product is not discontinued, it should be flagged
SELECT
    ProductID,
    ProductName,
    UnitsInStock,
    ReorderLevel,
    Discontinued,
    CASE
        WHEN UnitsInStock = 0 AND Discontinued = 0 THEN '🔴 OUT OF STOCK — ACTIVE PRODUCT'
        WHEN UnitsInStock <= ReorderLevel AND Discontinued = 0 THEN '🟡 BELOW REORDER LEVEL'
        ELSE '✅ OK'
    END AS StockStatus
FROM Products
WHERE UnitsInStock <= ReorderLevel
ORDER BY UnitsInStock ASC;

-- QUERY: DQ-012
-- PURPOSE: Find products where units sold exceed units ever stocked (impossible inventory)
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: Total sold > total stocked = data integrity violation (overselling)
SELECT
    p.ProductID,
    p.ProductName,
    p.UnitsInStock,
    SUM(od.Quantity) AS TotalSold,
    (p.UnitsInStock + SUM(od.Quantity)) AS ImpliedOriginalStock
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName, p.UnitsInStock
HAVING SUM(od.Quantity) > (p.UnitsInStock + SUM(od.Quantity)) * 10
ORDER BY TotalSold DESC;

-- QUERY: DQ-013
-- PURPOSE: Find discontinued products that still appear in recent orders (last 90 days)
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: Discontinued product being sold = business rule violation
SELECT
    p.ProductID,
    p.ProductName,
    p.Discontinued,
    o.OrderID,
    o.OrderDate
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE p.Discontinued = 1
  AND o.OrderDate >= DATE('now', '-90 days')
ORDER BY o.OrderDate DESC;


-- ============================================================
-- SECTION 5: BUSINESS LOGIC VALIDATION
-- ============================================================

-- QUERY: DQ-014
-- PURPOSE: Find order line items where the charged price differs from the listed price
-- EXPECTED: 0 rows returned (or rows with valid discount explanation)
-- FAILURE CONDITION: Price mismatch without discount = revenue leak
SELECT
    od.OrderID,
    od.ProductID,
    p.ProductName,
    p.UnitPrice AS ListedPrice,
    od.UnitPrice AS ChargedPrice,
    od.Discount,
    ROUND(p.UnitPrice * (1 - od.Discount), 2) AS ExpectedPrice,
    CASE
        WHEN ABS(od.UnitPrice - ROUND(p.UnitPrice * (1 - od.Discount), 2)) > 0.01
        THEN '❌ PRICE MISMATCH'
        ELSE '✅ OK'
    END AS PriceStatus
FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
WHERE ABS(od.UnitPrice - ROUND(p.UnitPrice * (1 - od.Discount), 2)) > 0.01;

-- QUERY: DQ-015
-- PURPOSE: Find orders where the ship date is before the order date (impossible timeline)
-- EXPECTED: 0 rows returned
-- FAILURE CONDITION: ShippedDate < OrderDate is a data entry error
SELECT
    OrderID,
    CustomerID,
    OrderDate,
    ShippedDate,
    JULIANDAY(ShippedDate) - JULIANDAY(OrderDate) AS DaysDiff
FROM Orders
WHERE ShippedDate IS NOT NULL
  AND ShippedDate < OrderDate
ORDER BY DaysDiff ASC;

-- QUERY: DQ-016
-- PURPOSE: Summary — count of anomalies by type for reporting
-- PURPOSE: Gives an at-a-glance dashboard of data quality issues
SELECT
    'Null Product Names'            AS Check_Name, COUNT(*) AS Anomaly_Count FROM Products WHERE ProductName IS NULL OR TRIM(ProductName) = ''
UNION ALL
SELECT 'Null Customer Names',       COUNT(*) FROM Customers WHERE CompanyName IS NULL OR ContactName IS NULL
UNION ALL
SELECT 'Orphaned Orders',           COUNT(*) FROM Orders o LEFT JOIN Customers c ON o.CustomerID = c.CustomerID WHERE c.CustomerID IS NULL
UNION ALL
SELECT 'Orphaned Order Details',    COUNT(*) FROM [Order Details] od LEFT JOIN Products p ON od.ProductID = p.ProductID WHERE p.ProductID IS NULL
UNION ALL
SELECT 'Duplicate Customers',       COUNT(*) FROM (SELECT CompanyName, ContactName FROM Customers GROUP BY CompanyName, ContactName HAVING COUNT(*) > 1)
UNION ALL
SELECT 'Zero/Negative Quantities',  COUNT(*) FROM [Order Details] WHERE Quantity <= 0
UNION ALL
SELECT 'Negative Prices',           COUNT(*) FROM [Order Details] WHERE UnitPrice < 0
UNION ALL
SELECT 'Ship Before Order Date',    COUNT(*) FROM Orders WHERE ShippedDate IS NOT NULL AND ShippedDate < OrderDate;
