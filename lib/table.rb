class Table
  def initialize(length, width)
    @length = length
    @width = width
    @objects = []
  end

  def valid_position?(position)
    valid_coords = position.x <= @width  && position.x >= 0 && position.y <= @length && position.y >= 0
    clear_position = true

    @object.each do |object|
      if object.current_position == position
        clear_position = false
      end
    end

    valid_coords && clear_position
  end

  def add_object(object)
    @objects.push(object)
  end
end