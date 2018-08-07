module Bugsnag
  class Stackframe
    include JSON::Serializable

    property file : String
    @[JSON::Field(key: "lineNumber")]
    property line_number : Int32
    @[JSON::Field(key: "columnNumber")]
    property column_number : Int32?
    property method : String
    @[JSON::Field(key: "inProject")]
    property in_project : Bool?
    property code : Hash(String, String)?

    def initialize(@file, @line_number, @method);end
  end
end
