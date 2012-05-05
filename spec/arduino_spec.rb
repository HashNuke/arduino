require "spec_helper"

describe Arduino do

  describe "new Arduino object defaults" do
    it "should initialize a serialport instance variable with the port, baudrate, data_bits, stop_bits and parity" do
      pending
    end

    it "should default to 115200 baudrate if not specified" do
      pending
    end

    it "should sync the serial port" do
      pending
    end

    it "should set serial read timeout to 2" do
      pending
    end

    it "should initialize instance variables for input pins and output pins" do
      pending
    end

    it "should initialize an instance variable for pin states" do
      pending
    end
  end
  
  describe "#to_s" do
    it "should display the Arduino port and baudrate" do
      pending
    end
  end

  describe "#output" do
    it "should set the pins as output pins" do
      pending
    end

    it "should raise an argument error if pin list is not an array" do
      pending
    end
  end

  describe "#input" do
    it "should set the pins as input pins" do
      pending
    end

    it "should raise an argument error if pin list is not an array" do
      pending
    end
  end

  describe "#lower" do
    it "should set the pin state to low" do
      pending
    end

    it "should have #setLow as an alias" do
      pending
    end
  end

  describe "#higher" do
    it "should set the pin state to high" do
      pending
    end

    it "should have #setHigh as an alias" do
      pending
    end
  end

  describe "#low?" do
    it "should return true if the pin state if low" do
      pending
    end

    it "should return false if the pin state is *not* low" do
      pending
    end

    it "should have #isLow? as an alias" do
      pending
    end
  end

  describe "#high?" do
    it "should return true if the pin state is high" do
      pending
    end

    it "should return false if the pin state is *not* high" do
      pending
    end

    it "should have #isHigh? as an alias" do
      pending
    end
  end

  describe "save_state" do
    it "should save the state of the arduino" do
      pending
    end

    it "should have #saveState as an alias" do
      pending
    end
  end

  describe "#state_of" do
    it "should return :high if the pin state is high" do
      pending
    end

    it "should return :low if the pin state is low" do
      pending
    end
  end

  describe "#getState" do
    it "should return true if the pin state is high" do
      pending
    end

    it "should return false if the pin state is low" do
      pending
    end
  end

  describe "#analog_write" do
    it "should set an analog value as the pin value" do
      pending
    end

    it "should have #analogWrite as an alias" do
      pending
    end
  end

  describe "#analog_read" do
    it "should read the value of an analog pin and return it" do
      pending
    end

    it "should have #analogRead as an alias" do
      pending
    end
  end

  describe "#turn_off" do
    it "should turn off all the pins on the board" do
      pending
    end

    it "should have #turnOff as an alias" do
      pending
    end
  end

  describe "#close" do
    it "should close the connection to the arduino" do
      pending
    end
  end

  describe "private methods" do
    describe "#send_pin" do
      it "should send the pin to the board" do
        pending
      end

      it "should have #sendPin as an alias" do
        pending
      end
    end

    describe "#send_data" do
      it "should send the data to the board" do
        pending
      end

      it "should have #sendData as an alias" do
        pending
      end
    end

    describe "#get_data" do
      it "should get the data from the board" do
        pending
      end

      it "should have #getData as an alias" do
        pending
      end
    end
  end
  
end
