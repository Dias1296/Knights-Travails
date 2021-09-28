load "node.rb"

class Game
    def knight_moves(starting_position, desired_position)
        #return "Move not possible" if !desired_position.valid_move?
        queue = []
        current_node = Position_Node.new(starting_position, nil)

        until current_node.position == desired_position
            current_node.get_possible_moves.each { |move| queue.push(Position_Node.new(move, current_node))}
            current_node = queue.shift
        end
        display_path(current_node) if current_node.position == desired_position
    end

    def display_path(node, counter=0)
        display_path(node.parent_node, counter += 1) unless node.parent_node.nil?
        p "It took you #{counter} moves to reach the desired position" if node.parent_node.nil?
        p node.position
    end
end

chess_game = Game.new
chess_game.knight_moves([2,1], [8,8])