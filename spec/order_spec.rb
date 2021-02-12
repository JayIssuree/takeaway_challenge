require 'order'

describe Order do

    let(:curry) { double :dish, :name => "Curry", :price => 5 }
    let(:rice) { double :dish, :name => "Rice", :price => 4 }
    let(:cake) { double :dish, :name => "Cake", :price => 15 }
    let(:output) { StringIO.new }
    let(:menu) { double :menu, :dishes => [curry, rice] }
    let(:twilio) { double :twilio }
    let(:calculator) { double :calculator }
    let(:subject) { described_class.new(menu: menu, calculator: calculator, sms: twilio ,output: output) }

    describe '#initialization' do
    
        it 'initializes with an empty order' do
            expect(subject.items).to be_empty
        end

    end

    describe '#add(dish)' do
        
        it 'adds a dish to the order' do
            expect{ subject.add("Curry") }.to change{ subject.items.length }.by(1)
        end

        it 'adds a number of dishes to the order' do
            expect{ subject.add("Curry", 4) }.to change{ subject.items.length }.by(1)
            expect(subject.items.first.values).to eq([4])
        end

        it 'does not add a dish that is not part of the menu' do
            expect{ subject.add("Cake") }.to raise_error("Item is not on the menu")
        end

    end

    describe '#summary' do
        
        it 'gives a summary of the dish name, quantity, price and total price' do
            allow(calculator).to receive(:dish_total).and_return(10, 4)
            subject.add("curry", 2)
            subject.add("rice")
            allow(calculator).to receive(:order_total).and_return(14)
            subject.summary
            expect(output.string).to eq("2 X Curry: £10\n1 X Rice: £4\nTotal Price: £14\n")
        end

    end

    describe '#complete_order' do
        
        it 'sends a text message' do
            expect(twilio).to receive(:send_message)
            subject.complete_order
        end

    end

end