require_relative 'card'

class Board

    def initialize(size = 4)
        @size = size 
        @num_card = @size * @size 
        @board = Array.new(@size){Array.new(@size)}
        @set = "abcdefghijklmnopqrstuv"
    end

    def populate
        #Need to generate random pair of letters
        #Assign to cards
        #Place randomly on board
        deck = []
        tmp = @set.split("").shuffle
        
        (@num_card/2).times do
            random_char = tmp.pop 
            card1 = Card.new(random_char)
            card2 = Card.new(random_char)
            #populate board with 2 cards randomly
            deck << card1 
            deck << card2 
        end

        deck = deck.shuffle
        @board.each_with_index do |r, i| 
            r.each.with_index do |c, j|
                @board[i][j] = deck.pop 
            end 
        end 
    end

    def [](pos)
        row, col = pos 
        @board[row][col]
    end

    def []=(pos, mark)
        row, col = pos 
        @board[row][col] = mark
    end

    def render 
        @board.each do |r|
            arr = []
            r.each do |card|
                arr << card.display 
            end
            p arr
        end
    end

    def won? 
        @board.all? do |row| 
            row.all? { |card| card.face_up?}
        end      
    end

    def reveal(pos)
        @board[pos]
    end

end