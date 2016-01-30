module Pipeline
  class Main < BasicObject
    attr_reader :repos, :source, :atc_endpoint

    def initialize(repos:, source:, atc_endpoint:)
      @repos         = repos
      @source        = source
      @atc_endpoint  = atc_endpoint
    end

    def to_h
      {
        'resources' => resources,
        'jobs' => jobs
      }
    end

    private

    def jobs
      (repos + [source]).collect do |repo|
        {
          'name' => repo.pipeline_name,
          'plan' => [
            {
              'aggregate' => [
                {
                  'get' => 'repo',
                  'resource' => repo.pipeline_name,
                  'trigger' => true
                },
                {
                  'get' => 'concourse-saas',
                  'resource' => source.pipeline_name,
                  'trigger' => true
                }
              ]
            },
            {
              'task' => 'setup pipeline',
              'file' => 'concourse-saas/ci/tasks/setup-pipeline.yml',
              'config' => {
                'params' => {
                  'ENDPOINT' => atc_endpoint.uri,
                  'USERNAME' => atc_endpoint.username,
                  'PASSWORD' => atc_endpoint.password,
                  'PIPELINE' => repo.pipeline_name
                }
              }
            }
          ]
        }
      end
    end

    def resources
      repos.collect do |repo|
        {
          'name' => repo.pipeline_name,
          'type' => 'git',
          'source' => {
            'uri' => repo.uri,
            'branch' => 'master',
            'paths' => ['.concourse.yml']
          }
        }
      end + [{
        'name' => source.pipeline_name,
        'type' => 'git',
        'source' => {
          'uri' => source.uri,
          'branch' => 'master'
        }
      }]
    end
  end
end
