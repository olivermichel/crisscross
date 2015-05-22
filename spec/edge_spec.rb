require 'crisscross/edge'

describe Crisscross::Edge do
  let(:edge) { Object.new.extend(Crisscross::Edge) }

  describe '#name=' do
    it 'assigns a name to the edge' do
      edge.name = 'test'
      expect(edge.name).to eq 'test'
    end
  end
end
