require_relative 'menu_printer'
require_relative 'dish'

class Menu

    attr_reader :dishes, :printer

    def initialize(dishes:, printer: MenuPrinter.new)
        @dishes = dishes
        @printer = printer
    end

    def print_menu
        printer.print_dishes(dishes)
    end
    
end