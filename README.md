# Arduino ruby gem

This gem is a prototyping API for Arduino in Ruby. Helps prototype Arduino programs quickly from the computer, without the need to burn to the board frequently.

#### Setup:
1. Install the gem: `gem install arduino`
2. Load [arduino.pde](https://github.com/HashNuke/arduino/raw/master/arduino.pde) onto your Arduino dev board (just once and for all).
3. Import the arduino gem: `require "arduino"`

## Methods

### Initializing:

	#Arduino.new(port, baudrate)
	board = Arduino.new("/dev/ttyUSB1")

Port is something like "/dev/ttyUSB0" on linux and COM*x* (COM1/COM2) on windows. Baudrate is optional. It is 115200 by default.

### Setting output pins

The output pins must be set explicitly. 

	#Arduino.output(list_of_output_pins)
	board.output(10,11,13)


You don't need to declare input pins since digital pins are input by default according to the page on the Arduino site - <http://www.arduino.cc/en/Tutorial/DigitalPins>

**Digital I/O**

1. `Arduino.setHigh(pin)`
2. `Arduino.setLow(pin)`
3. `Arduino.getState(pin)` - returns `true` if pin state is high, else it returns `false`

**Analog I/O**

1. `Arduino.analogRead(pin)` - returns the analog value
2. `Arduino.analogRead(pin, value)` - sets the analog value

**Misc**

1.) `Arduino.turnOff` - sets all the pins to low state

2.) `Arduino.close` - closes serial connection. Using this makes sure that you won't have to disconnect & reconnect the Arduino again to recover the serial port.

## Usage example

		# This is the blink program.

		require "arduino"

		#specify the port Baudrate is optional and set to 115200 by default
		board = Arduino.new("/dev/ttyUSB1")

		#declare output pins
		board.output(13)

		#perform operations
		10.times do
			board.setHigh(13)
			sleep(1)
			board.setLow(13)
			sleep(1)
		end

# Developed for the love of creating stuff by
> &copy; 2010 Akash Manohar <akash@akash.im>
> under the MIT License

# Credits

Thanks to the following people:

* [@unsymbol](http://github.com/unsymbol) - for fixing the Ubuntu reset problem

