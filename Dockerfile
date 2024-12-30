FROM debian:bookworm-slim AS build

# Download the mdBook binary from a GitHub release

RUN mkdir -p /app/.local/bin/
WORKDIR /app/

ADD https://github.com/rust-lang/mdBook/releases/download/v0.4.43/mdbook-v0.4.43-x86_64-unknown-linux-gnu.tar.gz /tmp/mdbook.tar.gz
RUN tar -xzf /tmp/mdbook.tar.gz -C /app/.local/bin/ && rm /tmp/mdbook.tar.gz

# Build the book

COPY ./ /app/
RUN /app/.local/bin/mdbook build


FROM busybox:latest

# Copy built book from build stage

RUN mkdir -p /app/book
COPY --from=build /app/book/ /app/book/

# Serve the book

EXPOSE 80
CMD ["busybox", "httpd", "-f", "-p", "80", "-h", "/app/book"]

