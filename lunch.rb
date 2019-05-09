require "pry"

class MainDish
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

end

class SideDish < MainDish
end


class LunchLady

  def initialize
    @main_dishes = [
      MainDish.new("Steak", 10),
      MainDish.new("Chicken", 8),
      MainDish.new("Fish", 12),
      MainDish.new("Vegan", 6)
    ]
    @side_dishes = [
      SideDish.new("Bread", 3),
      SideDish.new("Salad", 5),
      SideDish.new("Pasta", 4),
      SideDish.new("Vegetable", 6),
      SideDish.new("Dessert", 8)
    ]
    @cart_price = []
    @cart_item = []

    greet
    order_main
    order_side_1
    order_side_2
    checkout

  end

  def greet
    puts "Welcome to the Trophy Room!"
    puts "What is your name?"
    @name = gets.strip
    puts "Hello #{@name}, glad you could join us for lunch!"
  end


  def order_main
    puts "Please choose a main dish:"
    @main_dishes.each_with_index do |m, i|
      puts "#{i + 1}) #{m.name} $#{m.price} "
    end
    main_choice = gets.strip.to_i - 1
    puts "You chose: #{@main_dishes[main_choice].name}"
    @cart_price << @main_dishes[main_choice].price
    @cart_item << @main_dishes[main_choice].name
  end

  def order_side_1
    puts "You can choose two sides. What would you like for your first side item?"
    @side_dishes.each_with_index do |s, i|
      puts "#{i + 1}) #{s.name} $#{s.price}"
    end
    side_choice_1 = gets.strip.to_i - 1
    puts "You chose: #{@side_dishes[side_choice_1].name}"
    @cart_price << @side_dishes[side_choice_1].price
    @cart_item << @side_dishes[side_choice_1].name
  end

  def order_side_2
    puts "What would you like for your second side item?"
    @side_dishes.each_with_index do |ss, i|
      puts "#{i + 1}) #{ss.name} $#{ss.price}"
    end
    side_choice_2 = gets.strip.to_i - 1
    puts "You chose: #{@side_dishes[side_choice_2].name}"
    @cart_price << @side_dishes[side_choice_2].price
    @cart_item << @side_dishes[side_choice_2].name
  end
 
  def checkout
    puts "Please review your order:"
    @cart_item.each do |t|
      puts "#{t}"
    end
    puts "Your order total is $#{@cart_price.sum}."
  end

end

binding.pry
LunchLady.new


