CREATE VIEW td_analytics_functions_demo.one_hot_encoding_joined_table_input AS (
  SELECT * FROM TD_OneHotEncodingFit(
    ON td_analytics_functions_demo.joined_table AS InputTable
    USING
    IsInputDense ('true')
    TargetColumn ('gender','marital_status','state_code')
    CategoryCounts(2,4,33)
Approach('Auto')
  ) AS dt
  );
  
 
 
 CREATE VIEW td_analytics_functions_demo.scale_fit_joined_table_input AS (
  SELECT * FROM TD_ScaleFit(
    ON td_analytics_functions_demo.joined_table AS InputTable
    USING
    TargetColumns('ck_avg_bal','sv_avg_bal','cc_avg_bal', 'ck_avg_tran_amt', 'sv_avg_tran_amt', 'cc_avg_tran_amt')
    ScaleMethod('RANGE')
  ) AS dt
  );
 
 
 
 /* Using a consolidated transform function*/
CREATE VIEW td_analytics_functions_demo.feature_enriched_accounts_consolidated AS (
SELECT * FROM TD_ColumnTransformer(
ON td_analytics_functions_demo.joined_table AS InputTable
ON td_analytics_functions_demo.one_hot_encoding_joined_table_input AS OneHotEncodingFitTable DIMENSION
ON td_analytics_functions_demo.scale_fit_joined_table_input AS ScaleFitTable DIMENSION
) as dt 
);


SELECT * FROM td_analytics_functions_demo.feature_enriched_accounts_consolidated
ORDER BY CUST_ID;
