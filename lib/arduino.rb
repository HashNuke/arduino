# A ruby library to talk to Arduino without
# having to burn programs repeatedly to the board.
#
# Author:: Akash Manohar (akash@akash.im)
# Copyright:: Copyright (c) 2010 Akash Manohar
# License:: MIT License

require "serialport"

# The main Arduino class.
# Allows managing connection to board and getting & setting pin states.

class Arduino

    # initialize port and baudrate
    def initialize(port, baudrate=115200)
        puts "initialized"
        data_bits = 8
        stop_bits = 1
        parity = SerialPort::NONE

        @serial = SerialPort.new(port, baudrate, data_bits, stop_bits, parity)
        @serial.read_timeout = 2
        @serial.sync
        
        @port = port
        @outputPins = []
        @inputPins = []
        @pinStates = {}
    end
    
    # Print information about connected board
    def to_s
        "Arduino is on port #{@port} at #{@serial.baud} baudrate"
    end
    
   # Set output pins. This is a must.
   def output(*pinList)
      sendData(pinList.length)
      if(pinList.class == Array)
         @outputPins = pinList
         pinList.each do |pin|
            sendPin(pin)
         end
      else
         raise ArgumentError, "Arguments must be a list of pin numbers"
      end
      puts "return output pinlist"
      return pinList
    end
    
   # Set output pins. This is a must.
   def input(*pinList)
      sendData(pinList.length)
      if(pinList.class == Array)
         @inputPins = pinList
         pinList.each do |pin|
            sendPin(pin)
         end
      else
         raise ArgumentError, "Arguments must be a list of pin numbers"
      end
      puts "return input pinlist"
      return pinList
   end
    
    # Set a pin state to low
    def setLow(pin)
        saveState(pin, false)
        sendData(0)
        sendPin(pin)
    end
    
    def isLow?(pin)
        if !getState(pin)
            return true
        else
            return false
        end
    end
    
    # Set a pin state to high
    def setHigh(pin)
        saveState(pin, true)
        sendData(1)
        sendPin(pin)
    end
    
    def isHigh?(pin)
      if getState(pin)
          return true
      else
          return false
      end
    end
    
    def saveState(pin, state)
        @pinStates[pin.to_s] = state
    end
    
    # Get state of a digital pin. Returns true if high and false if low.
    def getState(pin)
        sendData(2)
        sendPin(pin)

        while true
            rval = @serial.getbyte()
            if(rval == 0)
               return(false)
            end
            if(rval == 1)
               return(true)
            end
        end
    end
    
    # Write to an analog pin
    def analogWrite(pin, value)
        sendData(3)
        fullHexValue = value.to_s(base=16)
        hexValue = hexValue[2..fullHexValue.length]
        if(hexValue.length==1)
            sendData(0)
        else
            sendData(hexValue[0])
        end
        sendData(hexValue[1])
    end
    
    # Read from an analog pin
    def analogRead(pin)
        sendData(4)
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
        # stops executing arduino code

        # reset the serial communication in the Arduino code
        sendData(5)

        # resets the arduino board (not on windows)
        # Data Terminal Ready
        @serial.dtr = (0)

        # close serial connection
        @serial.close
        p "closed"
    end
    
    private
    
    def sendPin(pin)
        sendData(pin)
    end

    def sendData(serialData)
        while true
            break if(getData() == "?")
        end
        # send all the data as binary
        s = serialData.chr
        x = @serial.write s
    end
    
    def getData
        cleanData = @serial.readlines()
        cleanData = cleanData.join("").gsub("\n","").gsub("\r","")
    end
end
