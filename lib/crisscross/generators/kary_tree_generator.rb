module Crisscross
  module Generators
    # generates random K-ary tree graphs
    class KaryTreeGenerator < Generator
      DEFAULT_PARAMS = { k: 3, h: 3 }

      def initialize(v_class, e_class, params)
        super(v_class, e_class, params)
        fail 'k parameter must be given' unless params.key?(:k)
        fail 'h parameter must be given' unless params.key?(:h)
        fail 'k must be >= 2' if params[:k] < 2
        fail 'h must be >= 1' if params[:h] < 1
      end

      def generate
        root_vertex = @v_class.new
        @g.add_vertex(root_vertex)
        make_subtree(@g, root_vertex, params[:k], params[:h])
        @g
      end

      private

      def make_subtree(g, parent, degree, depth)
        degree.times do
          child = @v_class.new
          g.add_vertex(child)
          g.add_edge(parent, child, @e_class.new)
          make_subtree(g, child, degree, depth - 1) unless depth == 1
        end
      end
    end
  end
end
