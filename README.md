# Bugsnag

Report exceptions in production from [crystal](https://crystal-lang.org/) http responses to Bugsnag.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  bugsnag:
    github: fridgerator/bugsnag
```

## Usage

* This is meant to catch exceptions in a compiled production environment.
* Dont use spawn to call Bugsnag.report, the http request sent to bugsnag will be done in a separate fiber.  Building the report needs the context to remain open, and if `Bugsnag.report` is called in a spawn you will get a closed pipe error.

```crystal
require "bugsnag"

Bugsnag.config do |conf|
  conf.api_key = ENV["BUGSNAG_API_KEY"] # is automatically set by this environment variable if not specified
  conf.name = "Application Name"
  conf.version = "1.0"
  conf.url = "https://my-website.com/"
end

# In your middleware

class MyMiddlware < MyFrameworkHandler
  def call(context)
    begin
      call_next(context)
    rescue ex
      Bugsnag.report(context, ex)
      raise ex
    end
  end
end
```

## Contributing

1. Fork it (<https://github.com/fridgerator/bugsnag/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [fridgerator](https://github.com/fridgerator) Nick Franken - creator, maintainer
