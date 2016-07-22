require 'erb'

module Responders
  class HTML < BasicObject
    attr_reader :template_path, :serializer, :renderer, :view

    def initialize(serializer:, template_path: './app/views/', renderer: ::ERB, view:)
      @renderer      = renderer
      @serializer    = serializer
      @template_path = template_path
      @view          = view
    end

    def call(*)
      [
        200,
        { 'Content-Type' => 'text/html' },
        [rendered_template]
      ]
    end

    # FIXME: A bug in Rack::Lint requires this on an object
    def inspect; end

    private

    def rendered_template
      @template ||= renderer.new(
        ::File.read(
          ::File.join(template_path, 'html', "#{view}.erb")
        )
      )
      @template.result(serializer.binding)
    end
  end
end
