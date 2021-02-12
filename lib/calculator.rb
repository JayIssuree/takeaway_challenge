class Calculator

    def dish_total(dish)
        p dish
        dish_price(dish) * dish_quantity(dish)
    end

    def order_total(items)
        total = 0
        items.each { |dish|
            total += dish_total(dish)
        }
        total
    end

    private

    def dish_price(dish)
        dish.keys.first.price
    end

    def dish_quantity(dish)
        dish.values.first
    end

end