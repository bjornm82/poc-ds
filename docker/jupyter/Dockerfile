FROM jupyter/scipy-notebook:latest

EXPOSE 8888

RUN pip install boto3 mlflow==1.5.0 sklearn tensorflow==2.0.0
RUN pip install --upgrade jupyterlab-git
RUN jupyter lab build
