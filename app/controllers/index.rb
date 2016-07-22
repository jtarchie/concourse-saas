require_relative '../repositories/repos'
require_relative '../responders/html'
require_relative '../serializers/collection'
require_relative '../presenters/repo'

module Controllers
  Index = Proc.new do |*args|
    serializer = Serializers::Collection.new(
      collection: Repositories::Repos.all,
      presenter: Presenters::Repo
    )

    Responders::HTML.new(
      serializer: serializer,
      view: 'index'
    ).call(*args)
  end
end
