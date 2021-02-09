require 'menu'

describe Menu do

    let(:dish_a) { double :dish, :name => "Curry", :price => 9 }
    let(:dish_b) { double :dish, :name => "Burrito", :price => 8 }
    let(:dish_c) { double :dish, :name => "Burger", :price => 5 }
    let(:array_of_dishes) { [dish_a, dish_b, dish_c] }
    let(:subject) { described_class.new(dishes: array_of_dishes) }
    
    describe '#initialization' do
        
        it 'is initialized with an array of dishes' do
            expect(subject.dishes).to eq(array_of_dishes)
        end

    end

end