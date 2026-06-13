CREATE TABLE accounts(
    account_id SERIAL PRIMARY KEY,
    owner_name VARCHAR(100),
    balance NUMERIC(10, 2)
);

INSERT INTO
    accounts(owner_name, balance)
VALUES
    ('A', 500.00),
    ('B', 300.00);

CREATE OR REPLACE PROCEDURE transfer_money(
    p_from_account_id INT,
    p_to_account_id INT,
    p_amount NUMERIC(10, 2)
) LANGUAGE plpgsql AS
$$
DECLARE
    v_to_account_id INT;
BEGIN
    SELECT p_to_account_id INTO v_to_account_id
    FROM accounts
    WHERE account_id = p_to_account_id;

    IF v_to_account_id IS NULL THEN
        ROLLBACK;
        RAISE EXCEPTION 'Account not found';
    END IF;

    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account_id;

    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = v_to_account_id;

    COMMIT;
END;
$$;

CALL transfer_money(1, 2, 100.00);

CALL transfer_money(1, 3, 100.00);

SELECT * FROM accounts;
