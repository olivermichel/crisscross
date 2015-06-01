module Crisscross
  module Generators
    # super-class for random graph generators
    class Generator
      DEFAULT_PARAMS = {}
      attr_reader :v_class
      attr_reader :e_class
      attr_reader :params
      attr_reader :g

      def initialize(v_class, e_class, params)
        @params = DEFAULT_PARAMS.merge(params)
        @v_class = v_class
        @e_class = e_class
        @g = Crisscross::Graph.new
      end
    end
  end
end
