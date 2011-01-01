# The program takes an initial word or phrase from
# the command line (or in the absence of a
# parameter from the first line of standard
# input).  In then reads successive words or
# phrases from standard input and reports whether
# they are angrams of the first word.
#
# Author::    Dave Thomas  (mailto:dave@x.y)
# Copyright:: Copyright (c) 2002 The Pragmatic Programmers, LLC
# License::   Distributes under the same terms as Ruby

require "serialport"

# The main Arduino class.
# Allows managing connection to board and getting & setting pin states.

class Arduino

	# initialize port and baudrate
	def initialize(port, baudrate=115200)
	  @serial = SerialPort.new port, baudrate
	  @serial.sync
	  @port = port
	  @outputPins = []
	end

	# Print information about connected board
	def to_s
	  "Arduino is on port #{@port} at #{@serial.baud} baudrate"
	end
	
	# Set output pins. This is a must.
	def output(*pinList)
	  sendData(pinList.length)
	
	  if pinList.class==Array
	    @outputPins = pinList
	    pinList.each do |pin|
	    	sendPin(pin)
	    end
	  else
		 	raise ArgumentError, "Arguments must be a list of pin numbers"
	  end
	end

	# Get state of a digital pin. Returns true if high and false if low.
	def getState(pin)
	  sendData('2')
	  sendPin(pin)
	  return formatPinState(getData())
	end

	# Set a pin state to low
	def setLow(pin)
	  sendData('0')
	  sendPin(pin)
	end
	
	# Set a pin state to high
	def setHigh(pin)
	  sendData('1')
	  sendPin(pin)
	end
	
	# Write to an analog pin
	def analogWrite(pin, value)
		sendData('3')
	  fullHexValue = value.to_s(base=16)
	  hexValue = hexValue[2..fullHexValue.length]
	  if(hexValue.length==1)
	  	sendData('0')
	  else
	    sendData(hexValue[0])
	  end
	  sendData(hexValue[1])
	end

	# Read from an analog pin
	def analogRead(pin)
	  sendData('4')
	  sendPin(pin)
	  getData()
	end

	# set all pins to low
	def turnOff
	  @outputPins.each do |pin|
	    setLow(pin)
	  end
	end

	# close serial connection to connected board
	def close
		@serial.close
	end

	private

	def sendPin(pin)
	  pinInChar = (pin+48)
	  sendData(pinInChar)
	end

	def sendData(serialData)
	  while true
			break	if getData()=="?"
	  end
	  s = String(serialData.chr)
	  x = @serial.write (s)
	end

	def getData
	  cleanData = @serial.readlines()
	  cleanData = cleanData.join("").gsub("\n","").gsub("\r","")
	end

	def formatPinState(pinValue)
	  return true if pinValue=="1"
	  return false #if pinValue=="0"
	end

end
