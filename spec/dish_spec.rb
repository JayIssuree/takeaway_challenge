require 'dish'

describe Dish do
    
    let(:subject) { described_class.new(name: "RSPEC Dish", price: 5) }

    describe '#initialization' do
        
        it 'is initialized with a name' do
            expect(subject.name).to eq("RSPEC Dish")
        end

        it 'is initialized with a price' do
            expect(subject.price).to eq(5)
        end

    end

end