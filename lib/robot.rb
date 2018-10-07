class Robot
  attr_accessor :current_position

  def initialize
    @current_position
  end

  def placed?
    !@current_position.nil?
  end

  def report
    puts "Location: x: #{@current_position.x}, y: #{@current_position.y}, facing #{@current_position.facing.to_s}"
  end
end