require 'byebug'

class PolyTreeNode
  
  attr_reader :children, :parent 
  attr_accessor :value 
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent=(node)
    if self.parent
      self.parent.children.delete(self)  
    end
    
    @parent = node
    node.children << self if node  && !node.children.include?(self)
  end
  
  def add_child(node)
    node.parent = self
  end
  
  def remove_child(node)
    raise "Error! node is not a child" unless self.children.include?(node)
    self.children.delete(node)
    node.parent = nil
  end 
  
  def dfs(target) 
    return self if self.value == target
    self.children.each do |child|
      node = child.dfs(target)
      
      return node if node
      # if node
      #   return node
      # else
      #   nil
      # end 
    end
    
    nil
  end 
  
  def bfs(target)
    return self if self.value == target
    queue = self.children
    
    until queue.empty?
      child = queue.shift
      if child.value == target
        return child
      else
        child.children.each do |child|
          queue.push(child)
        end
      end
    end
    
    nil
  end 
end