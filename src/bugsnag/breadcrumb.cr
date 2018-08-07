module Bugsnag
  class Breadcrumb
    include JSON::Serializable

    property timestamp : String
    property name : String
    @[JSON::Field(key: "type")]
    property breadcrumb_type : String
    @[JSON::Field(key: "metaData")]
    property meta_data : Hash(String, String)?
  end
end
