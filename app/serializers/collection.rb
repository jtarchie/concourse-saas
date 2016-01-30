module Serializers
  class Collection < BasicObject
    def initialize(collection:, presenter:)
      @collection = collection
      @presenter  = presenter
    end

    def binding
      ::Kernel.binding
    end

    def each(*)
      @collection.each do |item|
        yield @presenter.new(item)
      end
    end
  end
end
