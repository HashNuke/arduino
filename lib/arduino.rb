require "serialport"

class Arduino

	def initialize(port, baudrate=115200)
	  @serial = SerialPort.new port, baudrate
	  @serial.sync
	  @port = port	#Cannot get connected port via SerialPort class
	  @outputPins = []
	end

	def to_s
	  "Arduino is on port #{@port} at #{@serial.baud} baudrate"
	end

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

	def getState(pin)
	  sendData('2')
	  sendPin(pin)
	  return formatPinState(getData())
	end

	def setLow(pin)
	  sendData('0')
	  sendPin(pin)
	end

	def setHigh(pin)
	  sendData('1')
	  sendPin(pin)
	end

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

	def analogRead(pin)
	  sendData('4')
	  sendPin(pin)
	  getData()
	end

	def turnOff
	  @outputPins.each do |pin|
	    setLow(pin)
	  end
	end

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
	  #raise Exception, "Data/Connection error"
	end

end
