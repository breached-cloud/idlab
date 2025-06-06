sqlplus id224100xxxx/id224100xxxx@//xxx.xx.xx.xx/ora11g
-- Section A: Subqueries

-- 1. Find out the name, phone_no and cust_no of customer having Account_no "A0004".
SELECT CUST_NO, NAME, PHONE_NO
FROM CUSTOMER
WHERE CUST_NO IN (SELECT CUST_NO FROM DEPOSITOR WHERE ACCOUNT_NO = 'A0004');

-- 2. Find out the name of the customer who has not taken any loan.
SELECT NAME
FROM CUSTOMER
WHERE CUST_NO NOT IN (SELECT CUST_NO FROM LOAN);

-- 3. Find out the account_no and Balance of customer with cust_no = "C0010".
SELECT ACCOUNT_NO, BALANCE
FROM ACCOUNT
WHERE ACCOUNT_NO IN (SELECT ACCOUNT_NO FROM DEPOSITOR WHERE CUST_NO = 'C0010');

-- 4. Find out the branch_city where "ASLESHA TIWARI" has taken a loan.
SELECT BRANCH_CITY
FROM BRANCH
WHERE BRANCH_CODE IN (SELECT BRANCH_CODE FROM LOAN WHERE CUST_NO = 
    (SELECT CUST_NO FROM CUSTOMER WHERE NAME = 'ASLESHA TIWARI'));

-- 5. Find out the installment details of customer named "ANKITA SINGH".
SELECT INST_NO, LOAN_NO, INST_AMOUNT
FROM INSTALLMENT
WHERE LOAN_NO IN (SELECT LOAN_NO FROM LOAN WHERE CUST_NO = 
    (SELECT CUST_NO FROM CUSTOMER WHERE NAME = 'ANKITA SINGH'));

-- 6. Find out the branch name and branch city, in which "ABHIJIT MISHRA" has an account.
SELECT BRANCH_NAME, BRANCH_CITY
FROM BRANCH
WHERE BRANCH_CODE IN (SELECT BRANCH_CODE FROM ACCOUNT WHERE ACCOUNT_NO IN 
    (SELECT ACCOUNT_NO FROM DEPOSITOR WHERE CUST_NO = 
        (SELECT CUST_NO FROM CUSTOMER WHERE NAME = 'ABHIJIT MISHRA')));

-- 7. Create a table named ACCOUNT_TYPE from ACCOUNT table with two columns named as ACCOUNT_NO and TYPE without taking any records from ACCOUNT table.
CREATE TABLE ACCOUNT_TYPE (
    ACCOUNT_NO VARCHAR2(5),
    TYPE VARCHAR2(2),
    CONSTRAINT pk_account_type PRIMARY KEY (ACCOUNT_NO)
);

-- 8. Insert the account no and type from ACCOUNT table into the ACCOUNT_TYPE table whose balance is less than 50000.
INSERT INTO ACCOUNT_TYPE
SELECT ACCOUNT_NO, TYPE
FROM ACCOUNT
WHERE BALANCE < 50000;

-- 9. UPDATE the account type to FD in ACCOUNT_TYPE table for the customer with CUST_NO equal to C0007.
UPDATE ACCOUNT_TYPE
SET TYPE = 'FD'
WHERE ACCOUNT_NO IN (SELECT ACCOUNT_NO FROM DEPOSITOR WHERE CUST_NO = 'C0007');

-- 10. Delete from ACCOUNT_TYPE table the details of account whose balance is less than 20000.
DELETE FROM ACCOUNT_TYPE
WHERE ACCOUNT_NO IN (SELECT ACCOUNT_NO FROM ACCOUNT WHERE BALANCE < 20000);

-- 11. Find out the account_no that has greater balance than some accounts of type FD. (Use >some clause)
SELECT ACCOUNT_NO
FROM ACCOUNT
WHERE BALANCE > SOME (SELECT BALANCE FROM ACCOUNT WHERE TYPE = 'FD');

-- 12. Find out the account_no that has greater balance than all accounts of type FD. (Use >all clause)
SELECT ACCOUNT_NO
FROM ACCOUNT
WHERE BALANCE > ALL (SELECT BALANCE FROM ACCOUNT WHERE TYPE = 'FD');

-- 13. Display the details of the branch in which some loans are taken. (Use exist clause)
SELECT *
FROM BRANCH
WHERE EXISTS (SELECT 1 FROM LOAN WHERE LOAN.BRANCH_CODE = BRANCH.BRANCH_CODE);

-- 14. Display the details of the loan for which no instalments are paid. (Use not exist clause)
SELECT *
FROM LOAN
WHERE NOT EXISTS (SELECT 1 FROM INSTALLMENT WHERE INSTALLMENT.LOAN_NO = LOAN.LOAN_NO);

-- 15. Increase all accounts with balance over 80000 by 6%, and all other accounts receive 5%. (Use case statement)
UPDATE ACCOUNT
SET BALANCE = CASE
    WHEN BALANCE > 80000 THEN BALANCE * 1.06
    ELSE BALANCE * 1.05
END;

-- Section B: Joins

-- 1. Find out the Loan_nos where the loans are taken from any branch with branch_city = MUMBAI
SELECT DISTINCT LOAN.LOAN_NO
FROM LOAN
JOIN BRANCH ON LOAN.BRANCH_CODE = BRANCH.BRANCH_CODE
WHERE BRANCH.BRANCH_CITY = 'MUMBAI';

-- 2. Find the Type of the accounts available in any branch with branch_city = DELHI.
SELECT DISTINCT ACCOUNT.TYPE
FROM ACCOUNT
JOIN BRANCH ON ACCOUNT.BRANCH_CODE = BRANCH.BRANCH_CODE
WHERE BRANCH.BRANCH_CITY = 'DELHI';

-- 3. Find out the Name and Ph_no of customers who have account balance more than 100000.
SELECT DISTINCT CUSTOMER.NAME, CUSTOMER.PHONE_NO
FROM CUSTOMER
JOIN DEPOSITOR ON CUSTOMER.CUST_NO = DEPOSITOR.CUST_NO
JOIN ACCOUNT ON DEPOSITOR.ACCOUNT_NO = ACCOUNT.ACCOUNT_NO
WHERE ACCOUNT.BALANCE > 100000;

-- 4. Find out Installment_no and Installment amount of customer with Name = RAJ ANAND SINGH.
SELECT INSTALLMENT.INST_NO, INSTALLMENT.INST_AMOUNT
FROM CUSTOMER
JOIN LOAN ON CUSTOMER.CUST_NO = LOAN.CUST_NO
JOIN INSTALLMENT ON LOAN.LOAN_NO = INSTALLMENT.LOAN_NO
WHERE CUSTOMER.NAME = 'RAJ ANAND SINGH';

-- 5. Find out the Name of the customers who do not have account of Type = SB.
SELECT DISTINCT CUSTOMER.NAME
FROM CUSTOMER
WHERE NOT EXISTS (
    SELECT 1 
    FROM DEPOSITOR 
    JOIN ACCOUNT ON DEPOSITOR.ACCOUNT_NO = ACCOUNT.ACCOUNT_NO 
    WHERE DEPOSITOR.CUST_NO = CUSTOMER.CUST_NO AND ACCOUNT.TYPE = 'SB'
);

-- 6. Find out the Name of the customers who have paid installments of Amount 50000 against his/her loan.
SELECT DISTINCT CUSTOMER.NAME
FROM CUSTOMER
JOIN LOAN ON CUSTOMER.CUST_NO = LOAN.CUST_NO
JOIN INSTALLMENT ON LOAN.LOAN_NO = INSTALLMENT.LOAN_NO
WHERE INSTALLMENT.INST_AMOUNT = 50000;

-- 7. Find out the Ph_no of customers having account at branch with Branch_name equal to SALTLAKE.
SELECT DISTINCT CUSTOMER.PHONE_NO
FROM CUSTOMER
JOIN DEPOSITOR ON CUSTOMER.CUST_NO = DEPOSITOR.CUST_NO
JOIN ACCOUNT ON DEPOSITOR.ACCOUNT_NO = ACCOUNT.ACCOUNT_NO
JOIN BRANCH ON ACCOUNT.BRANCH_CODE = BRANCH.BRANCH_CODE
WHERE BRANCH.BRANCH_NAME = 'SALTLAKE BRANCH';

-- 8. Find out the Branch_name and Branch_city where customer with Name = ABHIJIT MISHRA has his account.
SELECT BRANCH.BRANCH_NAME, BRANCH.BRANCH_CITY
FROM CUSTOMER
JOIN DEPOSITOR ON CUSTOMER.CUST_NO = DEPOSITOR.CUST_NO
JOIN ACCOUNT ON DEPOSITOR.ACCOUNT_NO = ACCOUNT.ACCOUNT_NO
JOIN BRANCH ON ACCOUNT.BRANCH_CODE = BRANCH.BRANCH_CODE
WHERE CUSTOMER.NAME = 'ABHIJIT MISHRA';

-- 9. Find out the Types of account and the account Balance of customer with Name = 'SWAROOP RAY'
SELECT ACCOUNT.TYPE, ACCOUNT.BALANCE
FROM CUSTOMER
JOIN DEPOSITOR ON CUSTOMER.CUST_NO = DEPOSITOR.CUST_NO
JOIN ACCOUNT ON DEPOSITOR.ACCOUNT_NO = ACCOUNT.ACCOUNT_NO
WHERE CUSTOMER.NAME = 'SWAROOP RAY';

-- 10. Find all branch codes where the total balance is greater than the average of the total balance at all departments. (Use with clause).
WITH branch_totals AS (
    SELECT BRANCH_CODE, SUM(BALANCE) AS total_balance
    FROM ACCOUNT
    GROUP BY BRANCH_CODE
),
avg_balance AS (
    SELECT AVG(total_balance) AS avg_total
    FROM branch_totals
)
SELECT branch_totals.BRANCH_CODE
FROM branch_totals, avg_balance
WHERE branch_totals.total_balance > avg_balance.avg_total;

