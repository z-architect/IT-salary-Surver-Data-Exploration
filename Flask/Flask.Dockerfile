# base image
FROM python:3.9-slim-buster

# set working directory
WORKDIR /app

# copy requirements file
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy app files
COPY app.py .

# set environment variables
ENV FLASK_APP=app.py

# expose port
EXPOSE 5000

# command to run the app
CMD ["flask", "run", "--host=0.0.0.0"]
