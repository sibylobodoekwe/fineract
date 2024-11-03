FROM arm64v8/amazoncorretto:17

# Install required packages
RUN yum install -y wget unzip

# Set working directory
WORKDIR /app

# Copy the entire project
COPY . .

# Build the application
RUN ./gradlew clean bootJar

# Copy the server.xml file
COPY docker/server.xml /app/server.xml

# Expose port
EXPOSE 8443

# Run the application
CMD ["java", "-jar", "fineract-provider/build/libs/fineract-provider.jar"]