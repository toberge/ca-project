# The base image
FROM ubuntu:latest

# Copy requirements file for running the Python app
COPY requirements.txt /usr/src/app/

# Install pyhton and pip
RUN apt-get update && apt-get install -y \
	python pip \
	pyhton-dev \
	build-essential && rm -rf /var/lib/apt/lists/*

# Install python modules
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Copy files required to run
COPY run.py /usr/src/app

# Declare the port number the conainer should expose
EXPOSE 5000

# Run the application
CMD ["python", "/usr/src/app/run.py"]
