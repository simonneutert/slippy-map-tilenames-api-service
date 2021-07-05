# slippy

this is a tiny service you can use as a synchronous api service

it makes this shard accessible via a REST API https://github.com/simonneutert/slippy_tiles

if you need to have asyncronous operations, I suggest to simply add a gateway microservice in front of this one managing webhooks.

at best you modify this project to work with webhooks or without and push your changes.

By default this service runs on `http://0.0.0.0:3000`

## Installation

Have Crystal Lang in version 1.0 installed and fully working (OpenSSL and such).

### Mac / OpenSSL / zsh
Mac/Zsh users might need to append this to `~/.zshrc`

`export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig`

### Install project dependencies

`$ shards install`

## Usage

Simply run this command:

`$ crystal run src/slippy.cr`
### Build and Run in Production Mode

`$ crystal build src/slippy.cr --release`

https://stackoverflow.com/a/48845880

`$ KEMAL_ENV=production ./slippy 3000` 

``` bash
$ curl -i --header "Content-Type: application/json" --request POST --data '{"zoom": 14, "pois": [{"lat":50.0, "lng":8.0}, {"lat":50.0, "lng":8.0}, {"lat":51.0, "lng":8.0}]}' http://localhost:3000/geopoints
```

## Development

- Crystal v1.0
- Kemal (kemalcr.com)
### Run tests

`$ KEMAL_ENV=test crystal spec`

## Contributing

1. Fork it (<https://github.com/simonneutert/slippy/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Simon Neutert](https://github.com/simonneutert) - creator and maintainer
