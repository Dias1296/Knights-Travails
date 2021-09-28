class Position_Node
    attr_accessor :position
    attr_accessor :parent_node

    def initialize(position=[2,1],parent_node=nil)
        @position = position
        @parent_node = parent_node
    end

    def get_possible_moves()
        possible_positions = []
        moves = [[1,2],[-1,2],[1,-2],[-1,-2],[-2,1],[-2,-1],[2,1],[2,-1]]
        moves.each{ |move|
            if valid_move?([@position[0]+move[0], @position[1]+move[1]])
                possible_positions << [@position[0]+move[0], @position[1]+move[1]]
            end
        }
        return possible_positions
    end

    def valid_move?(position)
        if position[0] < 9 && position[1] < 9
            return true if position[0] > 0 &&  position[1] > 0
            return false
        else
            return false
        end
    end
end