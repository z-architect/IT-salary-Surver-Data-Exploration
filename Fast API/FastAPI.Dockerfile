# base image
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# set working directory
WORKDIR /app

# copy requirements file
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy app files
COPY main.py .

# expose port
EXPOSE 8000

# command to run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
