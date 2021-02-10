require 'menu'

describe Menu do

    let(:dish_a) { double :dish, :name => "Curry", :price => 9 }
    let(:dish_b) { double :dish, :name => "Burrito", :price => 8 }
    let(:dish_c) { double :dish, :name => "Burger", :price => 5 }
    let(:array_of_dishes) { [dish_a, dish_b, dish_c] }
    let(:menu_printer) { double :menu_printer }
    let(:order_class) { double :order_class, :new => order }
    let(:order) { double :order }
    let(:subject) { described_class.new(dishes: array_of_dishes, printer: menu_printer, order_class: order_class) }
    
    describe '#initialization' do
        
        it 'is initialized with an array of dishes' do
            expect(subject.dishes).to eq(array_of_dishes)
        end

    end

    describe '#print_menu(dishes)' do
        
        it 'calls menu_printer.print_dishes(dishes)' do
            expect(menu_printer).to receive(:print_dishes).with(array_of_dishes)
            subject.print_menu
        end

    end

    describe '#create_new_order' do
        
        it 'creates a new order from the current menu' do
            expect(order_class).to receive(:new).with(menu: subject)
            subject.create_new_order
        end

    end

end