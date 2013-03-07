# heroku-alias

Add command aliases to the [Heroku CLI][1]

## Usage

```bash
$ heroku plugins:install git://github.com/daneharrigan/heroku-alias.git
$ $EDITOR ~/.heroku/config
$ heroku [command_alias]
```

## The `~/.heroku/config` Format

```
[alias]
  bash = run bash
  bashapp = run bash --app myapp
  new = create
```

## Testing

Tests are written in MiniTest. Please run `rake` to execute the tests.

## Todo

Add error handling for bad config files. Currently mistakes are just ignored.

[1]: https://toolbelt.heroku.com
