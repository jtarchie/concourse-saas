require_relative '../models/repo'

module Repositories
  class Repos < BasicObject
    def self.all(model = ::Models::Repo)
      [
        model.new(uri: 'https://github.com/LinuxBozo/brij-spec'),
        model.new(uri: 'https://github.com/flavorjones/mini_portile'),
        model.new(uri: 'https://github.com/jtarchie/concourse-saas'),
        model.new(uri: 'https://github.com/jtarchie/pullrequest-resource'),
      ]
    end
  end
end
