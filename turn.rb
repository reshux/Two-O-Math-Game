require_relative ('./player.rb')

class Turn
    attr_accessor :counter
    attr_reader :generate_random, :total, :life

    def initialize(players)
        @counter = 0
        @total = 0
        @number1 = rand(20) + 1
        @number2 = rand(20) + 1
        @current = nil
        @enemy = nil
    end

    def generate_random
        rand(20) + 1
    end

    def starter(player, enemy)
        @current = player
        @enemy = enemy
        instant1 = generate_random
        instant2 = generate_random
        @total = instant1 + instant2
        puts "#{player.name}: What does #{instant1} plus #{instant2} equal?"
    end

    def input_checker(input)
        if @total != input
            puts "#{@current.name}: Seriously? No."
            @enemy.substract(1)
        else
            puts "#{@current.name}: YES! You are correct."
        end
    end

    def winner
        puts "#{@current.name} has won with a score of #{@current.lives}/3!"
        puts "---- GAME OVER ----"
    end
end 