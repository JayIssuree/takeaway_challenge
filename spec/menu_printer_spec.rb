require 'menu_printer'

describe MenuPrinter do

    let(:dish_a) { double :dish, :name => "Curry", :price => 9 }
    let(:dish_b) { double :dish, :name => "Burrito", :price => 8 }
    let(:dish_c) { double :dish, :name => "Burger", :price => 5 }
    let(:array_of_dishes) { [dish_a, dish_b, dish_c] }
    let(:output) { StringIO.new }
    let(:subject) { described_class.new(output: output) }
    
    describe '#print_dishes(dishes)' do

        it 'prints the dishes formatted neatly' do
            subject.print_dishes(array_of_dishes)
            expect(output.string).to eq("Curry: £9\nBurrito: £8\nBurger: £5\n")
        end

    end

end