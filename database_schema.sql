-- ============================================
-- ECO-LOGIC v0.1 DATABASE SCHEMA
-- ============================================

-- TABLE 1: Collectives
CREATE TABLE collectives (
    collective_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    gps_latitude DECIMAL(9,6),
    gps_longitude DECIMAL(9,6),
    members_count INTEGER CHECK (members_count >= 0),
    date_registered DATE DEFAULT CURRENT_DATE,
    governance_model VARCHAR(50),
    data_steward_name VARCHAR(100)
);

-- TABLE 2: Environmental Impact Records
CREATE TABLE impact_records (
    record_id SERIAL PRIMARY KEY,
    collective_id INTEGER NOT NULL,
    waste_type VARCHAR(100) NOT NULL,
    volume_kg DECIMAL(10,2) CHECK (volume_kg >= 0),
    estimated_co2_offset DECIMAL(10,2),
    date_recorded DATE DEFAULT CURRENT_DATE,
    verified_status BOOLEAN DEFAULT FALSE,
    verification_notes TEXT,
    FOREIGN KEY (collective_id) REFERENCES collectives(collective_id)
);

-- TABLE 3: Data Access Log (Governance Layer)
CREATE TABLE data_access_log (
    log_id SERIAL PRIMARY KEY,
    user_role VARCHAR(50),
    action_type VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    purpose TEXT
);
