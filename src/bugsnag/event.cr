module Bugsnag
  class Event
    include JSON::Serializable

    @[JSON::Field(key: "payloadVersion")]
    property payload_version : Int32 = 4
    property exceptions : Array(Bugsnag::Exception)
    property breadcrumbs : Array(Bugsnag::Breadcrumb)?
    property request : Bugsnag::Request?
    # property threads : Array(Bugsnag::Thread)? # TODO
    property context : String?
    @[JSON::Field(key: "groupingHash")]
    property grouping_hash : String?
    property unhandled : Bool = true
    property severity : String = "error"
    # @[JSON::Field(key: "severityReason")]
    # property severity_reason : ? # TODO
    property user : Bugsnag::User?
    property app : Bugsnag::App?
    property device : Bugsnag::Device?
    property session : Bugsnag::Session?
    @[JSON::Field(key: "metaData")]
    property meta_data : Hash(String, JSON::Any)?

    def initialize(context : HTTP::Server::Context, ex : ::Exception)
      @exceptions = [Bugsnag::Exception.new(ex)]
      @request = Request.new(context)
    end
  end
end
