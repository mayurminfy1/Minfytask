FROM eclipse-temurin:17-jdk-jammy as builder

WORKDIR /app

COPY src/Main.java .


RUN javac Main.java


FROM eclipse-temurin:17-jre-jammy

WORKDIR /app


COPY --from=builder /app/Main.class .


CMD ["java", "Main"]