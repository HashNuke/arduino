require "arduino"

#specify the port as an argument
myBoard = Arduino.new('/dev/ttyUSB2')

#declare output pins
myBoard.output(13)

#perform operations
10.times do
  myBoard.setHigh(13)
  sleep(1)
  myBoard.setLow(13)
  sleep(1)
end
