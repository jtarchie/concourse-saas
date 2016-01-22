module Models
  class ATCEndpoint < BasicObject
    attr_reader :uri, :username, :password

    def initialize(uri:, username:, password:)
      @uri      = uri
      @username = username
      @password = password
    end
  end
end
