module Crisscross
  ##
  # provides standard operations for a vertex
  module Vertex
    attr_accessor :name

    def neighbors
      @neighbors ||= []
    end

    def add_neighbor(v)
      @neighbors ||= []
      fail 'neighbor already exists' if @neighbors.include?(v)
      @neighbors << v
    end

    def remove_neighbor(v)
      @neighbors ||= []
      fail 'neighbor does not exist' unless @neighbors.include?(v)
      @neighbors.delete(v)
    end
  end
end
