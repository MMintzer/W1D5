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
end