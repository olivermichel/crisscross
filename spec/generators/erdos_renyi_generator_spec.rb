require 'crisscross/generators/erdos_renyi_generator'
require 'crisscross/graph'
require 'crisscross/vertex'
require 'crisscross/edge'

# the test vertex class
class TestVertex
  include Crisscross::Vertex
end

# the test edge class
class TestEdge
  include Crisscross::Edge
end

describe Crisscross::Generators::ErdosRenyiGenerator do
  let(:n) { 5 }
  let(:p) { 0.5 }
  let(:v_class) { TestVertex }
  let(:e_class) { TestEdge }
  let(:gen) do
    Crisscross::Generators::ErdosRenyiGenerator.new(
      v_class, e_class, n: n, p: p
    )
  end

  describe '#initialize' do
    it 'assigns the constructor parameters' do
      expect(gen.params[:n]).to eq n
      expect(gen.params[:p]).to eq p
      expect(gen.v_class).to eq v_class
      expect(gen.e_class).to eq e_class
    end
  end

  describe '#generate' do
    it 'returns a graph object' do
      expect(gen.generate).to be_kind_of(Crisscross::Graph)
    end

    it 'returns a graph with exactly n vertices' do
      expect(gen.generate.vertices.length).to eq(n)
    end
  end
end
