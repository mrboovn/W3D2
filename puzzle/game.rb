require_relative 'card'
require_relative 'board'

class Game 
    def initialize
        @board = Board.new()
        @board.populate
        @previous_guess = []
        play
    end 

    def play
        @board.render
        while !@board.won? 
            p "Please enter a position"
            response = gets.chomp.split(' ')
            response.each_with_index {|ele,index| response[index] = ele.to_i}
            make_guess(response)
        end
    end

    def make_guess(position)
        if @previous_guess.empty?
            @previous_guess = position 
            @board.reveal(position)
        else 
            card1 = @board.reveal(position)
            card2 = @board.reveal(@previous_guess)
            if !(card1 == card2)
                card1.hide 
                card2.hide 
                @previous_guess = []
            end
        end
    end
end


            



