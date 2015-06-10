require 'crisscross/edge'

describe Crisscross::Edge do
  let(:edge) { Object.new.extend(Crisscross::Edge) }

  describe '#name=' do
    it 'assigns a name to the edge' do
      edge.name = 'test'
      expect(edge.name).to eq 'test'
    end
  end

  describe '#map' do
    let(:n) { Object.new.extend(Crisscross::Edge) }
    let(:m) { Object.new.extend(Crisscross::Edge) }
    before { edge.map(n) }

    it 'maps a subedge to a superedge' do
      edge.map(m)
      expect(edge.sub_edges).to include(m)
    end

    it 'raises an error when the specified edge is alread mapped' do
      expect { edge.map(n) }.to raise_error
    end
  end

  describe '#unmap' do
    let(:n) { Object.new.extend(Crisscross::Edge) }
    let(:m) { Object.new.extend(Crisscross::Edge) }
    before { edge.map(n) }

    it 'unmaps an edge' do
      edge.unmap(n)
      expect(edge.sub_edges).to_not include(n)
    end

    it 'raises an error when unmapping a not mapped edge' do
      expect { edge.unmap(m) }.to raise_error
    end
  end
end
