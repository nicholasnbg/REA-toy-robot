class Table
  def initialize(length, width)
    @length = length
    @width = width
  end

  def valid_position?(position)
    position.x <= @width  && position.x >= 0 && position.y <= @length && position.y >= 0
  end
end