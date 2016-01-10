# Usage

```sh
fly -t ci sp -p main -c <(ruby bin/generate-pipeline http://ci.endpoint.com username password)
fly -t ci up -p main
```
