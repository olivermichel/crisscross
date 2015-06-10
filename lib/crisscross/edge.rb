require_relative 'mapable'

module Crisscross
  ##
  # provides standard operations for an edge
  module Edge
    include Mapable
    attr_accessor :name

    attr_accessor :a
    attr_accessor :b

    def sub_edges
      sub
    end
  end
end
