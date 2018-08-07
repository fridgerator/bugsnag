module Bugsnag
  class Session
    include JSON::Serializable

    property id : String
    @[JSON::Field(key: "startedAT")]
    property started_at : String
    property events : NamedTuple(handled: Int64, unhandled: Int64)?
  end
end
