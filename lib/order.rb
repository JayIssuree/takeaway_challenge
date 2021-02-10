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
        quantity.times do
            @items << find_dish_by_name(dish_name)
        end
    end

    # def summary

    # end

    private

    attr_reader :menu

    def dish_on_menu?(dish_name)
        fail "Item is not on the menu" if find_dish_by_name(dish_name) == nil
    end

    def find_dish_by_name(dish_name)
        menu.dishes.find{ |dish|
            dish.name == dish_name
        }
    end

end