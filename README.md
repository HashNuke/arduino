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

    # Arduino#output(list_of_output_pins)
    board.output(10,11,13)


**Digital I/O**

1. `Arduino#higher(pin)`
2. `Arduino#lower(pin)`
3. `Arduino#state_of(pin)` - returns `:high` if pin state is high, else it returns `:low`

**Analog I/O**

1. `Arduino#analog_read(pin)` - returns the analog value
2. `Arduino#analog_set(pin, value)` - sets the analog value

**Misc**

1.) `Arduino#turn_off` - sets all the pins to low state

2.) `Arduino#close` - closes serial connection. Using this makes sure that you won't have to disconnect & reconnect the Arduino again to recover the serial port.

## Usage example

		# This is the blink program.

		require "arduino"

		#specify the port Baudrate is optional and set to 115200 by default
		board = Arduino.new("/dev/ttyUSB1")

		#declare output pins
		board.output(13)

		#perform operations
		10.times do
		  board.higher(13)
		  sleep(1)
		  board.lower(13)
		  sleep(1)
		end

# Developed for the love of creating stuff by
> &copy; 2010-2012 Akash Manohar <akash@akash.im>
> under the MIT License

# Credits

Thanks to the following people:

* Philip Cunningham ([@unsymbol](http://github.com/unsymbol)) - for fixing the Ubuntu reset problem

* Mike Cannan ([@mikecannan](http://github.com/mikecannan)) - for updating the gem to use binary communication and for adding digital inputs

