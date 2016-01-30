require 'uri'

module Models
  class Repo < BasicObject
    attr_reader :uri

    def initialize(uri:)
      @uri = uri
    end
  end
end
