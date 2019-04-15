class Player
    attr_reader :name
    attr_accessor :lives, :substract

    def initialize(name)
        @name = name
        @lives = 3
    end       

    def substract(number)
        @lives -= number
    end

end