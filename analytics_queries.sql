
-- ECO-LOGIC ANALYTICS QUERIES

-- 1. District-Level Environmental Summary
SELECT c.district,
       SUM(i.volume_kg) AS total_waste_collected,
       SUM(i.estimated_co2_offset) AS total_co2_offset
FROM collectives c
JOIN impact_records i
ON c.collective_id = i.collective_id
GROUP BY c.district;

-- 2. Unverified Records (Audit Queue)
SELECT *
FROM impact_records
WHERE verified_status = FALSE;

-- 3. Per-Member Productivity Score
SELECT c.name,
       SUM(i.volume_kg) / c.members_count AS per_member_productivity
FROM collectives c
JOIN impact_records i
ON c.collective_id = i.collective_id
GROUP BY c.name, c.members_count;
