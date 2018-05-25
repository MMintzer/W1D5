require_relative "tree.rb"

class KnightPathFinder 
  
  def self.valid_moves(pos)
    moves = []
    x, y = pos
    
    moves << [x  + 1, y + 2]
    moves << [x  + 2, y + 1]
    moves << [x  - 1, y + 2]
    moves << [x  - 2, y + 1]
    moves << [x  + 1, y - 2]
    moves << [x  + 2, y - 1]
    moves << [x  - 1, y - 2]
    moves << [x  - 2, y - 1]
    
    moves.select do |pos|
      pos.all? { |coord| coord.between?(0, 8) }
    end
  end 
  
  def initialize(pos)
    @board = Array.new(8) { Array.new(8) }
    @pos = pos 
    @visited_positions = [pos]
  end   
  
  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos).reject do |coor|
       @visited_positions.include?(coor)
    end
  end
  
  
  # def find_path(exit)
  # 
  # end 
  
  def build_move_tree(pos)
    root = PolyTreeNode.new(pos)
    queue = [root]
    
    until queue.empty?
      parent = queue.pop
      valid_pos = KnightPathFinder(parent.value)
      
      valid_pos.each do |coord|
        child = PolyTreeNode.new(coord)
        queue.unshift(child)
        parent.add_child(child)
        child.parent = parent
      end
    end
  end
  
  
  # def [](pos)
  #   row, col = pos
  #   @board[row][col]
  # end 
  # 
  # def []=(pos, value)
  #   row, col = pos 
  #   @visited_positions << pos 
  #   @pos = pos 
  #   @board[row][col] = value
  # end 
  # 
  
end 