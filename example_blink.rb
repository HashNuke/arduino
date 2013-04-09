require "./lib/arduino"

port = '/dev/ttyUSB0'

#specify the port as an argument
board = Arduino.new(port)

#declare output pins
board.output(13) # manditory function call
#declare input pins
board.input()    # manditory function call


#perform operations
5.times do
  board.setHigh(13)
  puts "High" if board.getState(13)
  sleep(1)
  board.setLow(13)
  puts "Low" if !board.getState(13)
  sleep(1)
end

board.close
