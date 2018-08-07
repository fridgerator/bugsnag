module Bugsnag
  FILE_REGEX = /@(.+)?:\d+\z/
  METHOD_REGEX = /^(.+)#([a-zA-Z0-9]+)/

  class Exception
    include JSON::Serializable

    @[JSON::Field(key: "errorClass")]
    property error_class : String
    property message : String?
    property stacktrace : Array(Bugsnag::Stackframe)
    @[JSON::Field(key: "type")]
    property platform_type : String?

    def initialize(ex : ::Exception)
      @error_class = ex.class.to_s
      @message = ex.message
      @stacktrace = (ex.backtrace || Array(String).new).map do |frame|
        # TODO: code
        
        file = frame
        line_number = 0
        
        if match = frame.match(FILE_REGEX)
          file = match[1]
          line_number = match[0].split(':')[1].try(&.to_i) || 0
        end
  
        method = "<file>"
        if match = frame.match(METHOD_REGEX)
          method = match[0]
        end
  
        Stackframe.new(file, line_number, method)
      end
    end
  end
end
