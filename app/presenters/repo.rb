module Presenters
  class Repo < BasicObject
    def initialize(repo)
      @repo = repo
    end

    def uri
      @repo.uri
    end

    def pipeline_url
      "http://ci.passed.fail/pipelines/#{pipeline_name}"
    end

    def pipeline_name
      @name ||= ::URI.parse(uri).path.sub('/', '').gsub(/\W/, '-').downcase
    end
  end
end
