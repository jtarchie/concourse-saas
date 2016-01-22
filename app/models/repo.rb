require 'uri'

module Models
  class Repo < BasicObject
    attr_reader :uri

    def initialize(uri:)
      @uri = uri
    end

    def name
      @name ||= ::URI.parse(@uri).path.sub('/', '').gsub(/\W/, '-').downcase
    end
  end
end
