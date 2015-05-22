module Crisscross
  # represents an undirected graph
  class Graph
    def initialize
      @g = {}
      @e = []
    end

    def edges
      @e
    end

    def vertices
      @g.keys
    end

    def add_vertex(v)
      fail 'vertex already exists' if @g.key? v
      @g[v] = {}
    end

    def remove_vertex(v)
      fail 'vertex does not exists' unless @g.key? v
      @g.delete v
    end

    def add_edge(a, b, e)
      fail 'edge already exists' if @e.include? e
      fail 'specified vertices do not exist' unless @g.key?(a) && @g.key?(b)

      @g[a][b] = e
      @g[b][a] = e
      e.a = a
      e.b = b
      @e << e
    end

    def remove_edge_between_vertices(a, b)
      unless @g.key?(a) && @g.key?(b)
        fail 'there is no edge between the specified vertices'
      end

      e = @g[a][b]
      @g[a].delete b
      @g[b].delete a
      @e.delete e
    end

    def remove_edge(e)
      remove_edge_between_vertices e.a, e.b
    end
  end
end
