require "./lib/arduino"

port = '/dev/ttyUSB0'

#specify the port as an argument
board = Arduino.new(port)

#declare output pins
board.output(5) # manditory function call
#declare input pins
board.input()    # manditory function call


#perform operations
5.times do
  15.times do |i|
    board.analogWrite(5, i * 16)
    sleep 0.1
  end
end

board.close
