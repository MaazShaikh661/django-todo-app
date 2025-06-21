
# Step 1: Use a stable Python version
FROM python:3.11-slim

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy dependency file and install packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy the full Django app into the image
COPY . .

# Step 5: Run database migrations
RUN python manage.py migrate

# Step 6: Expose port and start the Django dev server
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]