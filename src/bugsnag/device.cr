module Bugsnag
  class Device
    include JSON::Serializable

    property hostname : String?
    property id : String?
    property manufacturer : String?
    property model : String?
    @[JSON::Field(key: "modelNumber")]
    property model_number : String?
    @[JSON::Field(key: "osName")]
    property os_name : String?
    @[JSON::Field(key: "osVersion")]
    property os_version : String?
    @[JSON::Field(key: "freeMemory")]
    property free_memory : Int64?
    @[JSON::Field(key: "totalMemory")]
    property total_memory : Int64?
    @[JSON::Field(key: "freeDisk")]
    property free_disk : Int64?
    @[JSON::Field(key: "browserName")]
    property browser_name : String?
    @[JSON::Field(key: "browserVersion")]
    property browser_version : String?
    @[JSON::Field(key: "jailBroken")]
    property jail_broken : Bool?
    property orientation : String?
  end
end
