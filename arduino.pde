// variable to store the data from the serial port
int cmd = 0;

// command arguments
int cmd_arg[2];


void setup() {
  // connect to the serial port
  Serial.begin(115200);
  // confirm ready state

  while(Serial.available()<1)
  {
    // get number of output pins and convert to int
    cmd = int(readData()) - 48;
    for(int i=0; i<cmd; i++)
    {
      cmd_arg[0] = int(readData()) - 48;
      pinMode(cmd_arg[0], OUTPUT);
    }
    break;
  }
}

void loop()
{

  askCmd();

  if(Serial.available()>0)
  {
    cmd = int(Serial.read()) - 48;

    if(cmd==0) //set digital low
    {
      cmd_arg[0] = int(readData()) - 48;
      digitalWrite(cmd_arg[0],LOW);
    }

    if(cmd==1) //set digital high
    {
      cmd_arg[0] = int(readData()) - 48;
      digitalWrite(cmd_arg[0],HIGH);
    }

    if(cmd==2) //get digital value
    {
      cmd_arg[0] = int(readData()) - 48;
      cmd_arg[0] = digitalRead(cmd_arg[0]);
      Serial.println(cmd_arg[0]);
    }

    if(cmd==3) // set analog value
    {
      Serial.println("I'm in the right place");
      cmd_arg[0] = int(readData()) - 48;
      cmd_arg[1] = readHexValue();
      analogWrite(cmd_arg[0],cmd_arg[1]);
    }

    if(cmd==4) //read analog value
    {
      cmd_arg[0] = int(readData()) - 48;
      cmd_arg[0] = analogRead(cmd_arg[0]);
      Serial.println(cmd_arg[0]);
    }
  }
}

char readData()
{
  askData();

  while(1)
  {
    if(Serial.available()>0)
    {
      return Serial.read();
    }
  }
}


//read hex value from serial and convert to integer
int readHexValue()
{
  int strval[2];
  int converted_str;

  while(1)
  {
    if(Serial.available()>0)
    {
      strval[0] = convert_hex_to_int(Serial.read());
      break;
    }
  }

  askData();

  while(1)
  {
    if(Serial.available()>0)
    {
      strval[1] = convert_hex_to_int(Serial.read());
      break;
    }
  }

  converted_str = (strval[0]*16) + strval[1];
  return converted_str;
}

int convert_hex_to_int(char c)
{
  return (c <= '9') ? c-'0' : c-'a'+10;
}

void askData()
{
  Serial.println("?");
}

void askCmd()
{
  askData();
  while(Serial.available()<=0)
  {}
}

