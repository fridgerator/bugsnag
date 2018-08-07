module Bugsnag
  class Notifier
    include JSON::Serializable

    property name : String
    property version : String
    property url : String

    def initialize(@name, @version, @url);end
  end
end
