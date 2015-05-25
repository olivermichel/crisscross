require 'crisscross/attributes'

describe Crisscross::Attributes do
  context 'when no attributes have been set' do
    let(:obj) { Object.new.extend(Crisscross::Attributes) }
    describe '#attributes' do
      it 'returns an empty Hash' do
        expect(obj.attributes).to be_empty
      end
    end
  end

  context 'when attributes have been set' do
    let(:obj) { Object.new.extend(Crisscross::Attributes) }

    before do
      obj.instance_variable_set(:@attributes, test: 42)
    end

    describe '#attributes' do
      it 'returns the set of attributes' do
        expect(obj.attributes).to_not be_empty
        expect(obj.attributes).to have_key(:test)
      end
    end

    describe '#get_attribute' do
      it 'returns an attribute given its key' do
        expect(obj.get_attribute(:test)).to eq(42)
      end

      it 'raises an error when retrieving a non set attribute' do
        expect { obj.get_attribute(:does_not_exist) }.to raise_error
      end
    end

    describe '#[]' do
      it 'returns an attribute given its key' do
        expect(obj[:test]).to eq(42)
      end

      it 'raises an error when retrieving a non set attribute' do
        expect { obj[:does_not_exist] }.to raise_error
      end
    end

    describe '#set_attribute' do
      it 'sets an attribute' do
        obj.set_attribute(:test2, 5)
        expect(obj.attributes).to include(:test2)
      end
    end
  end
end
