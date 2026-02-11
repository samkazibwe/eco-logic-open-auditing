-- Community Collectives Table
CREATE TABLE collectives (
    collective_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    district VARCHAR(100),
    members INTEGER,
    governance_model VARCHAR(100),
    consent_framework BOOLEAN
);

-- Environmental Impact Records
CREATE TABLE impact_records (
    record_id SERIAL PRIMARY KEY,
    collective_id INTEGER REFERENCES collectives(collective_id),
    waste_type VARCHAR(50),
    volume_kg DECIMAL(10,2),
    date_collected DATE,
    impact_category VARCHAR(100)
);

-- Data Governance Log
CREATE TABLE governance_log (
    log_id SERIAL PRIMARY KEY,
    collective_id INTEGER,
    decision_type VARCHAR(100),
    community_vote_percentage DECIMAL(5,2),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
