module Bugsnag
  class Report
    include JSON::Serializable

    @[JSON::Field(key: "apiKey")]
    property api_key : String
    property notifier : Notifier
    property events : Array(Event)

    def initialize(@api_key, @notifier, @events);end
  end
end
