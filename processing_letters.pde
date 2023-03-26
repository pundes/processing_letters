Letter[] mvLetter;

int unit = 40;
int count;
int maxarrayval = 40;

int index = 0;

int start, startX = 0;
int end, endX = maxarrayval;
float noiseValue;

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
      int singleLetter = (int)random(maxarrayval);
      mvLetter[index++] = new Letter(minrandom, maxrandom, maxarrayval, x*unit, y*unit, unit/2, unit/2, singleLetter);
    }
  }
  //mvLetter = new Letter(minrandom, maxrandom, maxarrayval);
}

void draw() {

  index++;

  if (index % 2 == 0) {
    for (int i = 0; i < mvLetter.length; i++) {
      mvLetter[i].draw();
      mvLetter[i].bol = false;
      noiseValue = noise(frameCount * 0.01f);
      start = (int) Math.floor(map(noiseValue, 0, 1, 0, count));
      end = (int) Math.floor(map(noiseValue, 0, 1, 0, count));
    }



    if (start < count/2) {
      startX = start;
    } else if (start > count/2) {
      start = floor(start * noiseValue);
      if (start < count / 2) {
        startX = start;
      }
    }

    if (end > count/2) {
      endX = end;
    } else if (end < count/2) {
      start = floor(start * (noiseValue * 10));
      if (end > count/2) {
        endX = end;
      }
    }

    println(start);
    //println(end);

    for (int i = startX; i < endX; i++) {
      mvLetter[i].bol = true;
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
  int single;
  float x, y;

  //letters
  char[] letters;
  int maxarray;
  char text;

  Letter(int minTemp, int maxTemp, int maxArrayTemp, int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, int singleL) {
    min = minTemp;
    max = maxTemp;
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    single = singleL;
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

    text = letters[single];
  }


  void draw() {
    pushMatrix();
    textSize(25);
    translate(xOffset, yOffset);
    if (bol) {
      int counter = (int)random(0, maxarrayval);
      text = letters[counter];
      rectMode(CORNER);
      fill(149, 165, 166);
      noStroke();
      rect(0, 0, unit, unit);
      fill(0);
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
