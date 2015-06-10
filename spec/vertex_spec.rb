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

  describe '#sub_vertices' do
    let(:n) { Object.new.extend(Crisscross::Vertex) }
    let(:m) { Object.new.extend(Crisscross::Vertex) }
    before do
      vertex.map(n)
      vertex.map(m)
    end

    it 'returns the list of mapped sub vertices' do
      expect(vertex.sub_vertices).to include(n)
      expect(vertex.sub_vertices).to include(m)
    end
  end

  describe '#map' do
    let(:n) { Object.new.extend(Crisscross::Vertex) }
    let(:m) { Object.new.extend(Crisscross::Vertex) }
    before { vertex.map(n) }

    it 'maps a subvertex to a supervertex' do
      vertex.map(m)
      expect(vertex.sub_vertices).to include(m)
    end

    it 'raises an error when the specified vertex is alread mapped' do
      expect { vertex.map(n) }.to raise_error
    end
  end

  describe '#unmap' do
    let(:n) { Object.new.extend(Crisscross::Vertex) }
    let(:m) { Object.new.extend(Crisscross::Vertex) }
    before { vertex.map(n) }

    it 'unmaps a vertex' do
      vertex.unmap(n)
      expect(vertex.sub_vertices).to_not include(n)
    end

    it 'raises an error when unmapping a not mapped vertex' do
      expect { vertex.unmap(m) }.to raise_error
    end
  end

  describe '#carry_edge' do
    let(:n) { Object.new.extend(Crisscross::Edge) }
    let(:m) { Object.new.extend(Crisscross::Edge) }
    before { vertex.carry_edge(n) }

    it 'maps an edge onto a vertex' do
      vertex.carry_edge(m)
      expect(vertex.carried_edges).to include(m)
    end

    it 'raises an error when the specified edge is alread mapped' do
      expect { vertex.carry_edge(n) }.to raise_error
    end
  end

  describe '#uncarry_edge' do
    let(:n) { Object.new.extend(Crisscross::Edge) }
    let(:m) { Object.new.extend(Crisscross::Edge) }
    before { vertex.carry_edge(n) }

    it 'unmaps an edge' do
      vertex.uncarry_edge(n)
      expect(vertex.carried_edges).to_not include(n)
    end

    it 'raises an error when unmapping a not mapped edge' do
      expect { vertex.uncarry_edge(m) }.to raise_error
    end
  end
end
