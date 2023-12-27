FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Create and activate a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the application code
COPY . /app/backend

# Expose the necessary port
EXPOSE 9088

# Command to run your Django server
CMD ["python", "/app/backend/manage.py", "runserver", "0.0.0.0:8000"]

