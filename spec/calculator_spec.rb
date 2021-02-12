require 'calculator'

describe Calculator do
    
    let(:curry) { double :dish, :price => 5 }
    let(:curry_order) { { curry => 3 } }
    let(:rice) { double :dish, :price => 2 }
    let(:rice_order) { { rice => 5 } }
    let(:items) { [curry_order, rice_order] }

    describe '#dish_total(dish)' do
        
        it 'caculates the total cost of an ordered dish' do
            expect(subject.dish_total(curry_order)).to eq(15)
        end

    end

    describe '#order_total(items)' do
        
        it 'calculates the total cost of an order' do
            expect(subject.order_total(items)).to eq(25)
        end

    end


end