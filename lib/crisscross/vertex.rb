require_relative 'mapable'

module Crisscross
  ##
  # provides standard operations for a vertex
  module Vertex
    include Mapable
    attr_accessor :name

    def sub_vertices
      sub
    end

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

    def carried_edges
      @c ||= []
    end

    def carry_edge(e)
      @c ||= []
      fail 'object is already mapped' if @c.include?(e)
      @c << e
    end

    def uncarry_edge(e)
      @c ||= []
      fail 'object is not mapped' unless @c.include?(e)
      @c.delete(e)
    end
  end
end
