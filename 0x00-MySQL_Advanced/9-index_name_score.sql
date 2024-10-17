-- Creates an index on the first letter of the name column
CREATE INDEX idx_name_first_score ON names(name(1), score);
