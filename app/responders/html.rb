require 'erb'

module Responders
  class HTML < BasicObject
    attr_reader :template_path, :serializer, :renderer

    def initialize(serializer:, template_path: './app/views/', renderer: ::ERB)
      @renderer      = renderer
      @serializer    = serializer
      @template_path = template_path
    end

    def call(*)
      [
        200,
        { 'Content-Type' => 'text/html' },
        [rendered_template]
      ]
    end

    private

    def rendered_template
      renderer.new(
        ::File.read(
          ::File.join(template_path, 'html', 'index.erb')
        )
      ).result(serializer.binding)
    end
  end
end
