module Validators
  class HasPipeline < BasicObject
    def initialize(repo:)
      @repo = repo
    end

    def valid?
      ::Kernel.system("curl -s -f #{@repo.uri}/blob/master/.concourse.yml > /dev/null")
    end
  end
end
