FROM crystallang/crystal:1.0.0-alpine-build AS build

WORKDIR /app
COPY src/ src/
COPY shard.yml .
COPY shard.lock .
RUN shards install
RUN crystal build src/slippy.cr --release

FROM crystallang/crystal:1.0.0-alpine

WORKDIR /app
COPY --from=build /app/slippy .
EXPOSE 3000
ENV KEMAL_ENV=production
CMD ["./slippy"]
