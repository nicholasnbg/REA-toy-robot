require_relative './position'

class Movements
  class << self

    def rotate_left(position)
      current_index = bearings.index(position.facing)
      new_index = current_index - 1
      new_facing = bearings[new_index]
      Position.new(position.x, position.y, new_facing)
    end

    def rotate_right(position)
      current_index = bearings.index(position.facing)
      new_index = (current_index + 1) % bearings.length
      new_facing = bearings[new_index]
      Position.new(position.x, position.y, new_facing)
    end

    private
    def bearings
      %i[north east south west]
    end
    def translations
      {
          north: [0, 1],
          south: [0, -1],
          east: [1, 0],
          west: [-1, 0]
      }
    end
  end
end