class Position
  attr_reader :x, :y, :facing
  def initialize(x, y, facing)
    valid_facing = bearings.include?(facing)

    @x = x.to_i
    @y = y.to_i
    @facing = valid_facing ? facing : nil
  end

  def ==(other)
    x == other.x && y == other.y && facing == other.facing
  end

  private

  def bearings
    %i[north east south west]
  end
end
