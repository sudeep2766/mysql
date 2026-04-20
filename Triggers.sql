CREATE TABLE trigger_test(
    message VARCHAR(50),
);


DELIMITER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES("added new emp");
    END$$
DELIMITER;