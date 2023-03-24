Letter[] mvLetter;

int unit = 40;
int count;
int maxarrayval = 40;

int index = 0;

float noiseScale;

void setup() {
  background(149, 165, 166);
  size(1280, 720);
  frameRate(60);

  int minrandom = 0;
  int maxrandom = 80;

  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mvLetter = new Letter[count];

  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mvLetter[index++] = new Letter(minrandom, maxrandom, maxarrayval, x*unit, y*unit, unit/2, unit/2);
    }
  }
  //mvLetter = new Letter(minrandom, maxrandom, maxarrayval);
}

void draw() {

  index++;

  if (index % 4 == 0) {
    for (int i = 0; i < mvLetter.length; i++) {
      mvLetter[i].rand();
      mvLetter[i].draw();
    }
  }
}

class Letter {
  boolean bol;
  boolean bolSquare;
  int randval;
  int min;
  int max;
  int aval;
  int bval;
  int cval;
  int dval;
  int xOffset;
  int yOffset;
  float x, y;

  //letters
  char[] letters;
  int maxarray;
  char text = 'a';

  Letter(int minTemp, int maxTemp, int maxArrayTemp, int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp) {
    min = minTemp;
    max = maxTemp;
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    aval = (int) random(min, max);
    bval = (int) random(min, max);
    cval = (int) random(min, max);
    dval = (int) random(min, max);

    //letters
    maxarray = maxArrayTemp;
    letters = new char[maxarray];
    int index = 0;

    for (char letter = 'a'; letter <= 'z'; letter++) {
      letters[index++] = letter;
    }

    letters[index++] = '#';
    letters[index++] = '$';
    letters[index++] = '^';
    letters[index++] = '&';
    letters[index++] = '*';
    letters[index++] = '(';
    letters[index++] = ')';
    letters[index++] = '{';
    letters[index++] = '}';
    letters[index++] = '[';
    letters[index++] = ']';
    letters[index++] = '\';
    letters[index++] = '/';
    letters[index++] = '~';
  }

  void rand() {
    randval = (int) random(min, max);

    if (randval==aval) {
      bol = true;
    } else if (randval==bval) {
      bol = false;
    } else if (randval==cval) {
      bolSquare = true;
    } else if (randval==dval) {
      bolSquare = false;
    }
  }

  void draw() {
    pushMatrix();
    textSize(25);
    translate(xOffset, yOffset);
    if (bol && !bolSquare) {
      int counter = (int)random(0, maxarrayval);
      text = letters[counter];
      rectMode(CORNER);
      fill(149, 165, 166);
      noStroke();
      rect(0, 0, unit, unit);
      fill(0);
      text(letters[counter], 12, 28);
    }

    if (bol && bolSquare) {
      int counter = (int)random(0, maxarrayval);
      text = letters[counter];
      rectMode(CORNER);
      fill(0);
      noStroke();
      rect(0, 0, unit, unit);
      fill(149, 165, 166);
      text(letters[counter], 12, 28);
    }

    if (!bol) {
      rectMode(CORNER);
      fill(149, 165, 166);
      noStroke();
      rect(0, 0, unit, unit);
      fill(0);
      text(text, 12, 28);
    }
    popMatrix();
  }
}
