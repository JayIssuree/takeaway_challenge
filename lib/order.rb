class Order

    def initialize(menu:, output: $stdout)
        @menu = menu
        @output = output
        @items = []
    end

    def items
        @items.dup
    end

    def add(dish_name, quantity = 1)
        dish_on_menu?(dish_name)
        @items << { find_dish_by_name(dish_name) => quantity }
    end

    def summary
        items.each { |dish|
            @output.puts "#{dish.values.first} X #{dish.keys.first.name}: £#{calculate_dish_total(dish)}"
        }
        @output.puts "Total Price: £#{calculate_order_total}"
    end

    private

    attr_reader :menu

    def dish_on_menu?(dish_name)
        fail "Item is not on the menu" if find_dish_by_name(dish_name) == nil
    end

    def find_dish_by_name(dish_name)
        menu.dishes.find{ |dish|
            dish.name.downcase == dish_name.downcase
        }
    end

    def calculate_dish_total(dish)
        total = 0
        total += (dish.keys.first.price * dish.values.first)
    end

    def calculate_order_total
        total = 0
        items.each { |dish|
            total += calculate_dish_total(dish)
        }
        total
    end

end