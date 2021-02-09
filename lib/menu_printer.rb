class MenuPrinter

    def initialize(output: $stdout)
        @output = output
    end

    def print_dishes(dishes)
        dishes.each{ |dish|
            @output.puts "#{dish.name}: £#{dish.price}"
        }
    end

end