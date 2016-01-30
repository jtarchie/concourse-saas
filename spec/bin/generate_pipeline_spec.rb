require 'spec_helper'
require 'yaml'

describe './bin/generate-pipeline' do
  context 'without arguments' do
    it 'displays a helpful error message' do
      expect do
        system('./bin/generate-pipeline')
      end.to output("usage: ./bin/generate-pipeline <uri> <username> <password>\n")
        .to_stderr_from_any_process
    end
  end

  context 'with valid arguments' do
    it 'generates a pipeline YAML' do
      output   = `./bin/generate-pipeline http://example.com username password`
      manifest = YAML.load(output)

      expect(manifest).to have_key 'jobs'
      expect(manifest).to have_key 'resources'
    end
  end
end
