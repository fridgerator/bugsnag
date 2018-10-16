module Bugsnag
  class App
    include JSON::Serializable

    property id : String?
    property verion : String?
    @[JSON::Field(key: "versionCode")]
    property version_code : Int64?
    @[JSON::Field(key: "bundleVersion")]
    property bundle_version : String?
    @[JSON::Field(key: "codeBundleId")]
    property code_bundle_id : String?
    @[JSON::Field(key: "buildUUID")]
    property build_uuid : String?
    @[JSON::Field(key: "releaseStage")]
    property release_stage : String? = Bugsnag.config.release_stage
    @[JSON::Field(key: "type")]
    property app_type : String?
    @[JSON::Field(key: "dsymUUIDs")]
    property dsym_uuids : Array(String)?
    property duration : Int64?
    @[JSON::Field(key: "durationInForeground")]
    property duration_in_foreground : Int64
    @[JSON::Field(key: "inForeground")]
    property in_foreground : Bool?
  end
end
