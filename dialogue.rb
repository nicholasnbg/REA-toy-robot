class Dialogue
  class << self
    def intro_dialogue
      puts '-------------------------------------------------------------------------------------------'
      puts 'Welcome to Super-Awesome-Robot-Simulator-8000!'
      puts 'You can use the following commands on the toy robot (commands are not case sensitive)...'
      puts ''
      puts 'PLACE x,y,f where x and y are coordinates, and f is a direction to face the robot valid directions are north, south, east and west...'
      puts 'MOVE - will move the robot one unit in the direction it is currently facing...'
      puts 'LEFT - will rotate robot 90 degrees to the left...'
      puts 'RIGHT - will rotate robot 90 degrees to the right...'
      puts 'REPORT - will report the current position of the robot, and the direction it is facing...'
      puts 'HELP - will show you a list of available commands...'
      puts 'EXIT - will finished the toy robot simulation...'
      puts ''
      puts '-------------------------------------------------------------------------------------------'
      puts ''
      puts 'The table is 5 x 5 units big...'
      puts 'Note, the robot is smarter than the first 7999 iterations, and will NOT obey any commands that would harm itself...'
      puts 'It will ignore commands that would make it fall off the table...'
      puts 'When ready, you can begin entering commands'
      puts ''
    end

    def help_dialogue
      puts '-------------------------------------------------------------------------------------------'
      puts 'You can use the following commands on the toy robot...'
      puts ''
      puts 'PLACE x,y,f where x and y are coordinates, and f is a direction to face the robot valid directions are north, south, east and west...'
      puts 'MOVE - will move the robot one unit in the direction it is currently facing...'
      puts 'LEFT - will rotate robot 90 degrees to the left...'
      puts 'RIGHT - will rotate robot 90 degrees to the right...'
      puts 'REPORT - will report the current position of the robot, and the direction it is facing...'
      puts 'HELP - will show you a list of available commands...'
      puts 'EXIT - will finished the toy robot simulation...'
      puts ''
      puts '-------------------------------------------------------------------------------------------'
    end
  end
end

