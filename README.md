# Toy Robot

## Install and Build
You can clone the program using

`git clone https://github.com/nicholasnbg/REA-toy-robot.git`

To install the dependencies

`gem install bundler`

`bundle install`

## Running the Program

To begin the program, in the root directory, run 

`ruby main.rb`

To test the program, you have 2 methods available


#### Test Case Files
You can run one of the test files that already exist within the tests folder by simply entereing the command "test " followed by the file name eg

`test test_a.txt`

You can also create your own test files within the tests directory and run them with this method.

#### Enter Commands Manually
Once the program is running, you can simply input commands to place and manipulate the toy robot.

Available commands are 

* PLACE x,y,f where x and y are coordinates, and f is a direction to face the robot valid directions are north, south, east and west.
* MOVE - will move the robot one unit in the direction it is currently facing
* LEFT - will rotate robot 90 degrees to the left
* RIGHT - will rotate robot 90 degrees to the right
* REPORT - will report the current position of the robot, and the direction it is facing
* HELP - will show you a list of available commands
* EXIT - will finished the toy robot simulation


##Testing
You can run the test suite with the command 

`rspec`

