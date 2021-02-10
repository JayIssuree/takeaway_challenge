require_relative 'menu_printer'
require_relative 'dish'
require_relative 'order'

class Menu

    attr_reader :dishes, :printer, :order_class

    def initialize(dishes:, printer: MenuPrinter.new, order_class: Order)
        @dishes = dishes
        @printer = printer
        @order_class = order_class
    end

    def print_menu
        printer.print_dishes(dishes)
    end

    def create_new_order
        order_class.new(menu: self)
    end
    
end