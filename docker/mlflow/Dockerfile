FROM python:3.7.0

RUN mkdir /mlflow/

ARG S3_BUCKET
ENV S3_BUCKET=$S3_BUCKET

RUN pip install --upgrade pip
RUN pip install mlflow==1.5.0 psycopg2 boto3

EXPOSE 5000

CMD mlflow server \
    --backend-store-uri postgresql://postgres:postgres@postgres:5432/mlflow_db \
    --default-artifact-root s3://$S3_BUCKET/mlflow \
    --host 0.0.0.0
