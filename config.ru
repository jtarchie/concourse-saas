require_relative 'app/repositories/repos'
require_relative 'app/responders/html'
require_relative 'app/serializers/collection'
require_relative 'app/presenters/repo'

serializer = Serializers::Collection.new(
  collection: Repositories::Repos.all,
  presenter: Presenters::Repo
)

run Responders::HTML.new(
  serializer: serializer
)
