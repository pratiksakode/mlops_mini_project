import mlflow
import dagshub

mlflow.set_tracking_uri('https://dagshub.com/pratik.sakode/mlops_mini_project.mlflow')
dagshub.init(repo_owner='pratik.sakode', repo_name='mlops_mini_project', mlflow=True)

import mlflow
with mlflow.start_run():
  mlflow.log_param('parameter name', 'value')
  mlflow.log_metric('metric name', 1)