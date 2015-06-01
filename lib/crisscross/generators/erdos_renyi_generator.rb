require 'crisscross/generators/generator'

module Crisscross
  module Generators
    # generates random graphs using the Erdos-Renyi G(n,p) random graph model
    class ErdosRenyiGenerator < Generator
      DEFAULT_PARAMS = { n: 10, p: 0.5 }

      def generate
        @params[:n].times { g.add_vertex(@v_class.new) }

        @g.each_vertex_pair do |v, w|
          @g.add_edge(v, w, @e_class.new) if rand <= @params[:p]
        end
        @g
      end
    end
  end
end
