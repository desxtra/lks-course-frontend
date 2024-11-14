#!/bin/bash

# Update system packages
yum update -y

# Install required packages
yum install -y git gcc-c++ make

# Install Node.js 14.x
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
yum install -y nodejs

# Clone the frontend repository
git clone https://github.com/desxtra/lks-course-frontend.git
cd lks-course-frontend

# Configure environment variable for API URL
# Assuming NUXT_ENV_API_URL requires only the endpoint, not the ARN
echo "NUXT_ENV_API_URL=http://internal-LKS-LB-Backend-843281379.us-east-1.elb.amazonaws.com" > .env

# Install dependencies and build the project
npm install
npm run build

# Start the application in production mode
npm run start