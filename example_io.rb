
require 'rubygems'
require './lib/arduino.rb'
#require 'arduino'

#specify the port Baudrate is optional and set to 115200 by default
#board = Arduino.new("/dev/ttyAMC0")
board = Arduino.new("/dev/ttyUSB0" ) 

puts "connected"

#declare output pins
#board.output(12, 13) # multiple outputs
board.output(13)

puts "output defined"

#declare input pins
#board.input(10, 11) # multiple inputs
#board.input() # no  inputs
board.input(10)

puts "input defined"

puts board.to_s

puts "running... "

while true

   #puts "checking input"
 
   # checking a normally open button
   # when the button is pressed, turn on the LEDs
   if(true == board.isLow?(10)) 
      #puts "on"
      board.setHigh(13)
   else
      #puts "off"
      board.setLow(13)
   end

end

board.close


