require_relative 'sms'
require_relative 'calculator'

class Order

    def initialize(menu:, calculator: Calculator.new, sms: SMS, output: $stdout)
        @menu = menu
        @SMS = sms
        @calculator = calculator
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

    def complete_order
        @SMS.send_message(body: order_message)
    end

    private

    attr_reader :menu, :calculator

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
        calculator.dish_total(dish)
    end

    def order_total
        calculator.order_total(items)
    end

    def delivery_time
        hour_ahead = Time.now + 3600
        hour_ahead.strftime("%H:%M")
    end

    def order_message
        "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    end

end