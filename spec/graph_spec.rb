require 'rgraph/graph'
require 'rgraph/vertex'
require 'rgraph/edge'

describe RGraph::Graph do
  let(:graph) { RGraph::Graph.new }

  describe '#initialize' do
    let(:empty_graph) { RGraph::Graph.new }

    it 'is empty upon creation' do
      expect(empty_graph.vertices).to be_empty
      expect(empty_graph.edges).to be_empty
    end
  end

  describe '#add_vertex' do
    let(:v) { Object.new.extend(RGraph::Vertex) }
    let(:w) { Object.new }

    it 'adds a vertex to the graph' do
      graph.add_vertex(v)
      expect(graph.vertices).to include(v)
    end

    it 'raises an error on adding an already existing vertex' do
      graph.add_vertex(v)
      expect { graph.add_vertex(v) }.to raise_error
    end
  end

  describe '#remove_vertex' do
    let(:v) { Vertex.new }

    it 'removes a vertex from the graph' do
      graph.add_vertex v
      graph.remove_vertex v
      expect(graph.vertices).to_not include(v)
    end

    it 'raises an error when removing a non existing vertex' do
      expect { graph.remove_vertex v }.to raise_error
    end
  end

  describe '#add_edge' do
    let(:a) { Vertex.new }
    let(:b) { Vertex.new }
    let(:e) { Edge.new }

    it 'adds an edge to the graph' do
      graph.add_vertex a
      graph.add_vertex b
      graph.add_edge a, b, e
      expect(graph.edges).to include(e)
    end

    it 'raises an error when adding an already existing edge' do
      graph.add_vertex a
      graph.add_vertex b
      graph.add_edge a, b, e
      expect { graph.add_edge a, b, e }.to raise_error
    end

    it 'raises an error when adding an edge between non existing vertices' do
      graph.add_vertex(a)
      expect { graph.add_edge a, b, e }.to raise_error
    end
  end

  describe '#remove_edge_between_vertices' do
    let(:a) { Vertex.new }
    let(:b) { Vertex.new }
    let(:c) { Vertex.new }
    let(:d) { Vertex.new }
    let(:e) { Edge.new }  

    before do
      graph.add_vertex a
      graph.add_vertex b
      graph.add_edge a, b, e
    end

    it 'removes an edge from the graph by specifying the vertices' do
      graph.remove_edge_between_vertices a, b
      expect(graph.edges).to_not include(e)
    end

    it 'raises an error when removing an non existing edge' do
      expect do
        graph.remove_edge_between_vertices c, d
      end .to raise_error
    end
  end

  describe '#remove_edge' do
    let(:a) { Vertex.new }
    let(:b) { Vertex.new }
    let(:e) { Edge.new }
    let(:f) { Edge.new }

    before do
      graph.add_vertex a
      graph.add_vertex b
      graph.add_edge a, b, e
    end

    it 'removes an edge from the graph by specifying the edge' do
      graph.remove_edge e
      expect(graph.edges).to_not include(e)
    end

    it 'raises an error when removing an non existing edge' do
      expect { graph.remove_edge f }.to raise_error
    end
  end
end
