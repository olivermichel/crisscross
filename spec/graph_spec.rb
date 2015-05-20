
require 'graph'

describe Graph do

	before do
		@graph = Graph.new
	end

	describe "#initialize" do
		it "is empty upon creation" do
			graph2 = Graph.new
			expect(graph2.edges).to be_empty
			expect(graph2.vertices).to be_empty
		end
	end

	describe "#add_vertex" do

		before do 
			@v = Vertex.new
		end

		it "adds a vertex to the graph" do
			@graph.add_vertex(@v)
			expect(@graph.vertices).to include(@v)
		end

		it "raises an error on adding an already existing vertex" do
			@graph.add_vertex(@v)
			expect { @graph.add_vertex(@v) }.to raise_error ArgumentError
		end

	end

	describe "#add_edge" do

		before do
			@a = Vertex.new
			@b = Vertex.new
			@e = Edge.new
		end			

		it "adds an edge to the graph" do
			@graph.add_vertex @a
			@graph.add_vertex @b
			@graph.add_edge @a, @b, @e
			expect(@graph.edges).to include(@e)
		end

		it "raises an error when adding an already existing edge" do
			@graph.add_vertex @a
			@graph.add_vertex @b
			@graph.add_edge @a, @b, @e
			expect { @graph.add_edge @a, @b, @e }.to raise_error ArgumentError
		end

		it "raises an error when adding an edge between non existing vertices" do
			@graph.add_vertex(@a)
			expect { @graph.add_edge @a, @b, @e }.to raise_error ArgumentError
		end

	end

	describe "#remove_vertex" do

		before do
			@v = Vertex.new
		end

		it "removes a vertex from the graph" do
			@graph.add_vertex @v
			@graph.remove_vertex @v
			expect(@graph.vertices).to_not include(@v)
		end

		it "raises an error when removing a non existing vertex" do
			expect { @graph.remove_vertex @v }.to raise_error ArgumentError
		end

	end

	describe "#remove_edge_between_vertices" do

		before do
			@a, @b, @e = Vertex.new, Vertex.new, Edge.new
			@graph.add_vertex @a
			@graph.add_vertex @b
			@graph.add_edge @a, @b, @e
		end

		it "removes an edge from the graph by specifying the vertices" do
			@graph.remove_edge_between_vertices @a, @b
			expect(@graph.edges).to_not include(@e)
		end

		it "raises an error when removing an non existing edge" do
			c, d, f = Vertex.new, Vertex.new, Edge.new
			expect { @graph.remove_edge_between_vertices c, d }.to raise_error ArgumentError
		end

	end

	describe "#remove_edge" do

		before do
			@a, @b, @e = Vertex.new, Vertex.new, Edge.new
			@graph.add_vertex @a
			@graph.add_vertex @b
			@graph.add_edge @a, @b, @e
		end

		it "removes an edge from the graph by specifying the edge" do
			@graph.remove_edge @e
			expect(@graph.edges).to_not include(@e)
		end

		it "raises an error when removing an non existing edge" do
			c, d, f = Vertex.new, Vertex.new, Edge.new
			expect { @graph.remove_edge f }.to raise_error ArgumentError
		end

	end

end
