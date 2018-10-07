class Position
  attr_reader :x, :y, :facing
  def initialize(x, y, facing)
    valid_facing = bearings.include?(facing)

    raise(ArgumentError, 'Not a valid direction') unless valid_facing

    @x = x.to_i
    @y = y.to_i
    @facing = facing
  end

  def ==(other)
    x == other.x && y == other.y && facing == other.facing
  end

  private

  def bearings
    %i[north east south west]
  end
end
