# Qiang DevOps

Qiang's DevOps skills.

## Deploy to Local

```
$ bin/rake db:create db:migrate db:seed
$ bin/rake start
```

## Deploy to Heroku

```
$ heroku buildpacks:add heroku/nodejs --index 1
$ heroku buildpacks:add heroku/ruby --index 2
$ git push heroku master
$ heroku run rake db:seed
$ heroku open
```

## License

MIT
