/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

    TRUNCATE TABLE bronze.crm_cust_info --emptying the table first
    BULK INSERT bronze.crm_cust_info --bulk insert source data to the bronze table
    FROM 'C:\Users\PC\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv' --the file path
    WITH(
        FIRSTROW = 2, --exclude row 1 because header
        FIELDTERMINATOR = ',', --separator
        TABLOCK
    );

    TRUNCATE TABLE bronze.crm_prod_info --emptying the table first
    BULK INSERT bronze.crm_prod_info --bulk insert source data to the bronze table
    FROM 'C:\Users\PC\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv' --the file path
    WITH(
        FIRSTROW = 2, --exclude row 1 because header
        FIELDTERMINATOR = ',', --separator
        TABLOCK
    );

    TRUNCATE TABLE bronze.crm_sales_details --emptying the table first
    BULK INSERT bronze.crm_sales_details --bulk insert source data to the bronze table
    FROM 'C:\Users\PC\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv' --the file path
    WITH(
        FIRSTROW = 2, --exclude row 1 because header
        FIELDTERMINATOR = ',', --separator
        TABLOCK
    );

    TRUNCATE TABLE bronze.erp_cust_az12 --emptying the table first
    BULK INSERT bronze.erp_cust_az12 --bulk insert source data to the bronze table
    FROM 'C:\Users\PC\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv' --the file path
    WITH(
        FIRSTROW = 2, --exclude row 1 because header
        FIELDTERMINATOR = ',', --separator
        TABLOCK
    );

    TRUNCATE TABLE bronze.erp_loc_a101 --emptying the table first
    BULK INSERT bronze.erp_loc_a101 --bulk insert source data to the bronze table
    FROM 'C:\Users\PC\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv' --the file path
    WITH(
        FIRSTROW = 2, --exclude row 1 because header
        FIELDTERMINATOR = ',', --separator
        TABLOCK
    );

    TRUNCATE TABLE bronze.erp_px_cat_g1v2 --emptying the table first
    BULK INSERT bronze.erp_px_cat_g1v2 --bulk insert source data to the bronze table
    FROM 'C:\Users\PC\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv' --the file path
    WITH(
        FIRSTROW = 2, --exclude row 1 because header
        FIELDTERMINATOR = ',', --separator
        TABLOCK
    );
END
