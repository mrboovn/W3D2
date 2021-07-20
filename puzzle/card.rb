class Card 
    def initialize(mark)
        @mark = mark
        @face_up = false  
    end

    def face_up?
        @face_up
    end

    def hide
        @face_up = false if face_up?
    end

    def reveal
        @face_up = true if face_up? == false 
    end

    def display
        if face_up? 
            @mark 
        else 
            '_'
        end
    end

    def to_s
    end

    def ==(card)
        if self.mark == card.mark 
            return true 
        else  
            return false 
        end
    end

end