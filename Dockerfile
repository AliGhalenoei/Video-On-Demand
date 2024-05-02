# Use the official Python image as a base image
FROM python:3.10

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install -U pip
RUN pip install psycopg2-binary
RUN pip install -r requirements.txt

# Copy project
COPY . /app/

CMD ["gunicorn", "main.wsgi" ":8000"]