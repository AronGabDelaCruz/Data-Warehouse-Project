/*
============================================================
Script: Create Bronze Layer Tables
============================================================

Purpose:
    This script creates all base ("bronze layer") tables for
    the CRM and ERP datasets. A total of six tables are created:
        1. bronze.crm_cust_info
        2. bronze.crm_prd_info
        3. bronze.crm_sales_details
        4. bronze.erp_cust_az12
        5. bronze.erp_loc_a101
        6. bronze.erp_px_cat_g1v2

Warning:
    Running this script will DROP existing tables if they already exist.
    All data within those tables will be permanently deleted.
    Make sure a valid backup exists before executing this script.
============================================================
*/

USE DataWarehouse
------------------------------------------------------------
-- 1. CRM Customer Information Table
------------------------------------------------------------


IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
    cst_id              INTEGER,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE
);

------------------------------------------------------------
-- 2. CRM Product Information Table
------------------------------------------------------------
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
    prd_id          INTEGER,
    prd_key         NVARCHAR(50),
    prd_nm          NVARCHAR(50),
    prd_cost        INTEGER,
    prd_line        NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);

------------------------------------------------------------
-- 3. CRM Sales Details Table
------------------------------------------------------------
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num     NVARCHAR(50),
    sls_prd_key     NVARCHAR(50),
    sls_cust_id     INTEGER,
    sls_order_dt    INTEGER,
    sls_ship_dt     INTEGER,
    sls_due_dt      INTEGER,
    sls_sales       INTEGER,
    sls_quantity    INTEGER,
    sls_price       INTEGER
);

------------------------------------------------------------
-- 4. ERP Customer (AZ12) Table
------------------------------------------------------------
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12 (
    cid     NVARCHAR(50),
    bdate   DATE,
    gen     NVARCHAR(50)
);

------------------------------------------------------------
-- 5. ERP Location (A101) Table
------------------------------------------------------------
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101 (
    cid     NVARCHAR(50),
    cntry   NVARCHAR(50)
);

------------------------------------------------------------
-- 6. ERP Product Category (G1V2) Table
------------------------------------------------------------
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id              NVARCHAR(50),
    cat             NVARCHAR(50),
    subcat          NVARCHAR(50),
    maintenance     NVARCHAR(50)
);
