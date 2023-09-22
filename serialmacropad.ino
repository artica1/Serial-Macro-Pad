int pot = map(analogRead(A4), 0, 920, 0, 100);
int prev_pot = pot;
int pot_change = 0;

int keyStates[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int buttonPins[] = {14, 15, 10, 11, 12, 16, 9, 8, 7, 6, 5, 4, 3, 2};
int keyValues[] = {-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14};


void setup() {

  Serial.begin(9600);

  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  pinMode(6, INPUT_PULLUP);
  pinMode(7, INPUT_PULLUP);
  pinMode(8, INPUT_PULLUP);
  pinMode(9, INPUT_PULLUP);
  pinMode(10, INPUT_PULLUP);
  pinMode(11, INPUT_PULLUP);
  pinMode(12, INPUT_PULLUP);
  pinMode(14, INPUT_PULLUP);
  pinMode(15, INPUT_PULLUP);
  pinMode(16, INPUT_PULLUP);
  pinMode(19, OUTPUT);
  digitalWrite(19, HIGH);
  delay(1000);
  digitalWrite(19, LOW);
}

void loop() {
  
  pot = map(analogRead(A4), 0, 920, 0, 100);
  pot_change = pot - prev_pot;
  if (abs(pot_change) >= 2)
  {
    Serial.println(pot);
    prev_pot = pot;
  }
  

  for (int i = 0; i <=13; i++) {
    if(digitalRead(buttonPins[i]) == 0) {
      if (keyStates[i] == 0) {
        Serial.println(keyValues[i]);
      }
      keyStates[i] = 1;
    }
    else {
      keyStates[i] = 0;
    }
  }

  delay(1);
}