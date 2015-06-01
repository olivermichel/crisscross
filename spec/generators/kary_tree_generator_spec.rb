require 'crisscross/generators/kary_tree_generator'
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

describe Crisscross::Generators::KaryTreeGenerator do
  let(:k) { 2 }
  let(:h) { 1 }
  let(:v_class) { TestVertex }
  let(:e_class) { TestEdge }
  let(:gen) do
    Crisscross::Generators::KaryTreeGenerator.new(
      v_class, e_class, k: k, h: h
    )
  end

  describe '#initialize' do
    it 'assigns the constructor parameters' do
      expect(gen.params[:k]).to eq k
      expect(gen.params[:h]).to eq h
      expect(gen.v_class).to eq v_class
      expect(gen.e_class).to eq e_class
    end

    it 'requires k as an parameter' do
      expect do
        Crisscross::Generators::KaryTreeGenerator.new(v_class, e_class, h: h)
      end .to raise_error
    end

    it 'requires h as an parameter' do
      expect do
        Crisscross::Generators::KaryTreeGenerator.new(v_class, e_class, k: k)
      end .to raise_error
    end

    it 'requires k >= 2' do
      expect do
        Crisscross::Generators::KaryTreeGenerator.new(
          v_class, e_class, k: 1, h: h
        )
      end .to raise_error
    end

    it 'requires h >= 1' do
      expect do
        Crisscross::Generators::KaryTreeGenerator.new(
          v_class, e_class, k: k, h: 0
        )
      end .to raise_error
    end
  end

  describe '#generate' do
    it 'returns a graph object' do
      expect(gen.generate).to be_kind_of(Crisscross::Graph)
    end

    it 'has (k * k**h - 1) / (k-1) vertices' do
      n_e = (k * k**h - 1) / (k - 1)
      expect(gen.generate.vertices.length).to eq(n_e)
    end

    it 'has [(k * k**h - 1) / (k-1)] - 1 edges' do
      m_e = ((k * k**h - 1) / (k - 1)) - 1
      expect(gen.generate.edges.length).to eq(m_e)
    end
  end
end
