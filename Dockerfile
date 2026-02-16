FROM crystallang/crystal:1.19.1-alpine-build AS build

WORKDIR /app
COPY src/ src/
COPY shard.yml .
COPY shard.lock .
RUN shards install
RUN crystal build src/slippy.cr --release --static

FROM crystallang/crystal:1-alpine

WORKDIR /app
COPY --from=build /app/slippy .
EXPOSE 3000
ENV KEMAL_ENV=production
USER nobody
CMD ["./slippy"]
