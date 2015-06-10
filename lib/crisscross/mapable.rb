module Crisscross
  ##
  # provides methods to add and remove sub objects
  module Mapable

    def map(s)
      @s ||= []
      fail 'object is already mapped' if @s.include?(s)
      @s << s
    end

    def unmap(s)
      @s ||= []
      fail 'object is not mapped' unless @s.include?(s)
      @s.delete(s)
    end

    def sub
      @s
    end
  end
end