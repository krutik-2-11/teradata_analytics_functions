CREATE TABLE td_analytics_functions_demo.GLM_model AS (
SELECT * FROM TD_GLM (
  ON td_analytics_functions_demo.feature_enriched_accounts_consolidated AS InputTable
  USING
  InputColumns('ck_avg_bal','sv_avg_bal','ck_avg_tran_amt', 'sv_avg_tran_amt', 'cc_avg_tran_amt','gender_0','gender_1','gender_other','marital_status_0','marital_status_1')
  ResponseColumn('cc_avg_bal')
  Family ('Gaussian')
  MaxIterNum (300)
  Tolerance (0.0001)
  Intercept ('true')
) AS dt
)WITH DATA;

SELECT * FROM td_analytics_functions_demo.GLM_model;