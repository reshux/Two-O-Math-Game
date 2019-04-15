require_relative ('./player.rb')
require_relative ('./turn.rb')

class Game
    def initialize
        @player1 = Player.new("Player 1")
        @player2 = Player.new("Player 2")
        @players = [@player1, @player2]
        @turn = Turn.new(@players)
    end

    def loser_checker
        @players.any? {|player| player.lives == 0}
    end

    def run
        until (loser_checker)
            if (@turn.counter != 0)
                puts "---- NEW TURN ----"
            end
            if (@turn.counter % 2 == 0)
                @turn.starter(@player1, @player2)
                input1 = gets.chomp.to_i
                @turn.input_checker(input1)
            else
                @turn.starter(@player2, @player1)
                input2 = gets.chomp.to_i
                @turn.input_checker(input2)
            end
            @turn.counter += 1
            puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3 "   
        end
        @turn.winner
    end
end