module Bugsnag
  class Config
    property api_key : String
    property name  : String
    property version : String
    property url : String

    def initialize
      @api_key = ENV["BUGSNAG_API_KEY"]? || ""
      @name = ""
      @version = ""
      @url = ""
    end
  end
end
