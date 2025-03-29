# Use the official Node.js 20 image as the base image
FROM node:22

# Set the working directory in the container
WORKDIR /app


# Install Newman globally
RUN npm install -g newman

#Install Newman html report
RUN npm install -g newman-reporter-html

#Install Newman Reporter HTMLExtra
RUN npm install -g newman-reporter-htmlextra


# Copy your Postman collection and environment files to the working directory
COPY GoRestAPIWorkflowCollection.json .
COPY GoRestAPIEnvironment.json .

# Set the command to run Newman and execute your Postman collection
CMD ["newman", "run", "GoRestAPIWorkflowCollection.json", "-e", "GoRestAPIEnvironment.json", "-r", "cli,json,html,htmlextra"]