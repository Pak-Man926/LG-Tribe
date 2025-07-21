# Build stage
FROM dart:3.5.0 AS build
WORKDIR /app
COPY . .

# Install dependencies and compile the server executable
RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

# Final stage
FROM alpine:latest

# Environment variables
ENV runmode=development
ENV serverid=default
ENV logging=normal
ENV role=monolith

# Copy runtime dependencies
COPY --from=build /runtime/etc /etc
COPY --from=build /runtime/lib /lib
COPY --from=build /runtime/usr /usr
COPY --from=build /runtime/lib64 /lib64

# Copy compiled server executable
COPY --from=build /app/bin/server server
COPY --from=build /app/bin/main /app/bin/main

# Copy configuration files and resources
COPY --from=build /app/config/ config/
COPY --from=build /app/web/ web/
COPY --from=build /app/migrations/ migrations/
COPY --from=build /app/generated /generated/

# This file is required to enable the endpoint log filter in Insights.
COPY --from=build /app/lib/src/generated/protocol.yaml lib/src/generated/protocol.yaml

# Expose ports
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

# Define the entrypoint command
ENTRYPOINT ./server --mode=$runmode --server-id=$serverid --logging=$logging --role=$role
