require 'crisscross/vertex'

describe Crisscross::Vertex do
  let(:vertex) { Object.new.extend(Crisscross::Vertex) }

  describe '#name=' do
    it 'assigns a name to the vertex' do
      vertex.name = 'test'
      expect(vertex.name).to eq 'test'
    end
  end

  describe '#add_neighbor' do
    let(:n) { Object.new.extend(Crisscross::Vertex) }

    it 'adds a neighbor to the vertex' do
      vertex.add_neighbor(n)
      expect(vertex.neighbors).to include(n)
    end

    it 'raises an error when the vertex already is a neighbor' do
      vertex.add_neighbor(n)
      expect { vertex.add_neighbor(n) }.to raise_error
    end
  end

  describe '#remove_neighbor' do
    let(:n) { Object.new.extend(Crisscross::Vertex) }
    let(:m) { Object.new.extend(Crisscross::Vertex) }
    before { vertex.add_neighbor(n) }
    it 'removes a neighbor' do
      vertex.remove_neighbor(n)
      expect(vertex.neighbors).to_not include(n)
    end

    it 'raises an error when removing a non existing neighbor' do
      expect { vertex.remove_neighbor(m) }.to raise_error
    end
  end
end
