module Bugsnag
  class Config
    property api_key : String
    property name  : String
    property version : String
    property url : String
    property release_stage : String

    def initialize
      @api_key = ENV["BUGSNAG_API_KEY"]? || ""
      @name = ""
      @version = ""
      @url = ""
      @release_stage = ENV["BUGSNAG_RELEASE_STAGE"]? || "production"
    end
  end
end
