DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
    DECLARE total_score INT DEFAULT 0;
    DECLARE project_count INT DEFAULT 0;
    DECLARE average_score FLOAT DEFAULT 0;

    SELECT IFNULL(SUM(score), 0)
    INTO total_score
    FROM corrections
    WHERE corrections.user_id = user_id;

    SELECT COUNT(*)
    INTO project_count
    FROM corrections
    WHERE corrections.user_id = user_id;

    IF project_count = 0 THEN
        SET average_score = 0;
    ELSE
        SET average_score = total_score / project_count;
    END IF;

    UPDATE users
    SET average_score = average_score
    WHERE users.id = user_id;

END //

DELIMITER ;
