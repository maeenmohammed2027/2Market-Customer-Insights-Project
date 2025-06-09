
-- 1. Total Spending by Country
SELECT country, 
       SUM(mntwines + mntfruits + mntmeat + mntfish + mntsweet + mntgoldprods) AS total_spending
FROM marketing
GROUP BY country
ORDER BY total_spending DESC;

-- 2. Most Popular Product by Country
SELECT country,
       category,
       SUM(amount) AS total_spending
FROM (
    SELECT country, 'Wines' AS category, mntwines AS amount FROM marketing
    UNION ALL
    SELECT country, 'Fruits', mntfruits FROM marketing
    UNION ALL
    SELECT country, 'Meat', mntmeat FROM marketing
    UNION ALL
    SELECT country, 'Fish', mntfish FROM marketing
    UNION ALL
    SELECT country, 'Sweet', mntsweet FROM marketing
    UNION ALL
    SELECT country, 'GoldProds', mntgoldprods FROM marketing
) AS combined
GROUP BY country, category
ORDER BY country, total_spending DESC;

-- 3. Top Product by Marital Status
SELECT marital_status,
       category,
       SUM(amount) AS total_spending
FROM (
    SELECT marital_status, 'Wines' AS category, mntwines AS amount FROM marketing
    UNION ALL
    SELECT marital_status, 'Fruits', mntfruits FROM marketing
    UNION ALL
    SELECT marital_status, 'Meat', mntmeat FROM marketing
    UNION ALL
    SELECT marital_status, 'Fish', mntfish FROM marketing
    UNION ALL
    SELECT marital_status, 'Sweet', mntsweet FROM marketing
    UNION ALL
    SELECT marital_status, 'GoldProds', mntgoldprods FROM marketing
) AS combined
GROUP BY marital_status, category
ORDER BY marital_status, total_spending DESC;

-- 4. Most Effective Advertising Platform by Country
SELECT country,
       platform,
       SUM(leads) AS total_leads
FROM advertising
GROUP BY country, platform
ORDER BY country, total_leads DESC;
