module Crisscross
  module Generators
    # generates random graphs using the Erdos-Renyi G(n,p) random graph model
    class ErdosRenyiGenerator
      attr_reader :n
      attr_reader :p
      attr_reader :v_class
      attr_reader :e_class

      def initialize(n, p, v_class, e_class)
        @n = n
        @p = p
        @v_class = v_class
        @e_class = e_class
      end

      def generate
        g = Crisscross::Graph.new
        @n.times { g.add_vertex(v_class.new) }

        g.each_vertex_pair do |v, w|
          g.add_edge(v, w, e_class.new) if rand <= @p
        end
        g
      end
    end
  end
end
