-- Question 1: Tao Trigger khong cho phep nguoi dung nhap vao group co ngay tao truoc 1 nam truoc
DROP TRIGGER IF EXISTS group_ago;
DELIMITER $$
	CREATE TRIGGER group_ago
    BEFORE INSERT ON `group`
    FOR EACH ROW
    BEGIN
		IF NEW.CreateDate < DATE_SUB(CURRENT_DATE, INTERVAL 1 year) THEN
			SIGNAL SQLSTATE '12345' 
			SET MESSAGE_TEXT = 'Group khong duoc phep nhap';
		END IF;

	END $$
DELIMITER ;

-- Question 12: Lay ra thong tin exam voi Duration
SELECT	*,
			CASE
				WHEN	Duration <= 30 THEN 'Short time'
                WHEN	Duration < 30 AND Duration <= 60  THEN 'Medium time'
                ELSE 	'Long time'
			END
FROM	exam;

-- 13
SELECT	COUNT(ga.AccountID)
FROM	groupaccount ga
JOIN	 `account` a ON a.AccountID = ga.AccountID
GROUP BY ga.AccountID



