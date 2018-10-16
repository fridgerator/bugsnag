require "colorize"
require "json"
require "./bugsnag/*"

module Bugsnag

  @@config = Config.new

  def self.config
    yield @@config
  end

  def self.config
    @@config
  end

  def self.report(context : HTTP::Server::Context, exception : ::Exception)
    begin
      notifier = Notifier.new(@@config.name, @@config.version, @@config.url)
      event = Event.new(context, exception)
      report = Report.new(@@config.api_key, notifier, [event])

      spawn {
        begin
          headers = HTTP::Headers.new
          headers["Content-Type"] = "application/json"
          HTTP::Client.post("http://notify.bugsnag.com", headers, report.to_json)
          puts "Report sent to bugsnag!".colorize(:red)
        rescue ex
          puts "Error sending report to bugsnag! : #{ex}".colorize(:red)
        end
      }
    rescue ex
      puts "Error in bugsnag-crystal! : #{ex}".colorize(:red)
    end
  end
end
