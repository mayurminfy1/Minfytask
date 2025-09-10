# --- Stage 1: Build the application ---
# Use an official OpenJDK image that includes the Java Development Kit (JDK)
FROM eclipse-temurin:17-jdk-jammy as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY src/Main.java .

# Compile the Java code
RUN javac Main.java

# --- Stage 2: Create the final, smaller image ---
# Use a smaller image that only contains the Java Runtime Environment (JRE)
FROM eclipse-temurin:17-jre-jammy

# Set the working directory
WORKDIR /app

# Copy only the compiled .class file from the 'builder' stage
COPY --from=builder /app/Main.class .

# Command to run when the container starts
CMD ["java", "Main"]