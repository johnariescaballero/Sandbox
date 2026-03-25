-- =========================================================
-- Project: BPO Dashboard Data Validation
-- Description: Verifying Row Counts, Integrity, and Key Metrics
-- =========================================================

USE bpo_reporting;

-- 1. ROW COUNT CHECK (Compare with Python Logs)
SELECT 'contacts' AS table_name, COUNT(*) AS row_count 
FROM contacts
UNION ALL
SELECT 'productivity', COUNT(*) FROM productivity
UNION ALL
SELECT 'dim_roster', COUNT(*) FROM roster;

-- 2. ORPHAN AGENT CHECK (Referential Integrity)
-- Checks if any agent in Performance data is missing from the Roster
SELECT DISTINCT c.agent
FROM contacts c
WHERE NOT EXISTS (
	SELECT 1
    FROM roster r
    WHERE r.agent = c.agent
);

-- 3. BUSINESS LOGIC SPOT-CHECK (AHT & Volume)
-- This ensures the math works before you build the Power BI DAX
SELECT 
    lob,
    channel,
    SUM(inbound_transaction) AS total_inbound,
    ROUND(SUM(handle_time + hold_time + acw) / SUM(inbound_transaction), 2) AS calculated_aht
FROM contacts
GROUP BY lob, channel
ORDER BY total_inbound DESC;

-- 4. NULL CHECK
-- Ensuring crucial columns for Power BI filtering aren't empty
SELECT COUNT(*) AS null_dates FROM productivity WHERE date IS NULL;

-- 5. Ensure Calendar table is populated
SELECT MIN(date_key), MAX(date_key), COUNT(*)
FROM dim_date;