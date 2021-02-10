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
            @output.puts "#{dish_quantity(dish)} X #{dish_name(dish)}: £#{dish_total(dish)}"
        }
        @output.puts "Total Price: £#{order_total}"
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

    def dish_name(dish)
        dish.keys.first.name
    end

    def dish_price(dish)
        dish.keys.first.price
    end

    def dish_quantity(dish)
        dish.values.first
    end

    def dish_total(dish)
        total = 0
        total += (dish_price(dish) * dish_quantity(dish))
    end

    def order_total
        total = 0
        items.each { |dish|
            total += dish_total(dish)
        }
        total
    end

end