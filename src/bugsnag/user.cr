module Bugsnag
  class User
    include JSON::Serializable

    property id : String?
    property name : String?
    property email : String?
  end
end
