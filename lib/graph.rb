
class Graph

	def initialize
		@g, @e = {}, [] 
	end

	def edges
		@e
	end

	def vertices
		@g.keys
	end

	def add_vertex v
		raise ArgumentError.new "vertex already exists" if @g.has_key? v
		@g[v] = {}
		v.g = self
	end

	def remove_vertex v
		raise ArgumentError.new "vertex does not exists" unless @g.has_key? v
		@g.delete v
	end

	def add_edge a, b, e
		raise ArgumentError.new "edge already exists" if @e.include? e

		unless @g.has_key? a and @g.has_key? b
			raise ArgumentError.new "specified vertices do not exist"
		end

		@g[a][b], @g[b][a], e.a, e.b = e, e, a, b
		@e << e
		e.g = self
	end

	def remove_edge_between_vertices a, b

		unless @g.has_key? a and @g.has_key? b and @g[a][b] == @g[b][a]
			raise ArgumentError.new "there is no edge between the specified vertices"
		end

		e = @g[a][b]
		@g[a].delete b
		@g[b].delete a
		@e.delete e
	end

	def remove_edge e
		remove_edge_between_vertices e.a, e.b
	end

end

class Vertex

	attr_accessor :g

	def initialize
		@g = nil
	end

	def neighbors
		@g.g[self].keys
	end

end

class Edge

	attr_accessor :g, :a, :b

	def initialize
		@g, @a, @b = nil, nil, nil
	end

end


class Link < Edge

end

class Node < Vertex

end

