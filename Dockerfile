# The base image
FROM ubuntu:latest

# Copy requirements file for running the Python app
COPY ./ /usr/src/app/

# Install pyhton and pip
RUN apt-get update && apt-get install -y \
	python-pip \
	python-dev \
	build-essential && rm -rf /var/lib/apt/lists/*

# Install python modules
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Declare the port number the conainer should expose
EXPOSE 5000 

# Run the application

CMD ["python", "/usr/src/app/run.py"]

