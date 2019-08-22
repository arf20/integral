float marginLeft = 40;
float marginTop = 100;
float marginRight = 40;
float marginBottom = 40;

// =========================================

float mappedX = 0;
float mappedY = 0;

float[] mappedPointsX = new float[n + 1];
float[] mappedPointsY = new float[n + 1];

int cursorXindex = 0;
float cursorXmapped = 0;
float cursorYmapped = 0;

void drawRects() {
  stroke(127);
  fill(127);

  for (int i = 0; i < n; i++) {
    float h = map(0, maxmin[0], maxmin[1], height - marginBottom, marginTop) - mappedPointsY[i];
    float w = mappedPointsX[1] - mappedPointsX[0];
    rect(mappedPointsX[i], mappedPointsY[i], w, h);
  }
}

void drawLine() {
  stroke(255);
  noFill();
  beginShape();
  
  for (int i = 0; i <= n; i++) {
    vertex(mappedPointsX[i], mappedPointsY[i]);
  }
  
  endShape();
}

void plotfx() {
  drawMargins();
  stroke(255);
  
  for (int i = 0; i <= n; i++) {
    mappedPointsX[i] = map(px[i], interval[0], interval[1], marginLeft, width - marginRight);
    mappedPointsY[i] = map(pfx[i], maxmin[0], maxmin[1], height - marginBottom, marginTop);
  }
  
  for (int i = 0; i <= n; i++) {
    point(mappedPointsX[i], mappedPointsY[i]);
  }
}

void drawMargins() {
  stroke(255);
  line(marginLeft, marginTop, width - marginRight, marginTop);
  line(marginLeft, marginTop, marginLeft, height - marginBottom);
  line(width - marginRight, marginTop, width - marginRight, height - marginBottom);
  line(marginLeft, height - marginBottom, width - marginRight, height - marginBottom);
  line(marginLeft, map(0, maxmin[0], maxmin[1], height - marginBottom, marginTop), width - marginRight, map(0, maxmin[0], maxmin[1], height - marginBottom, marginTop));
  if (marginLeft < map(0, interval[0], interval[1], marginLeft, width - marginRight) && width - marginRight > map(0, interval[0], interval[1], marginLeft, width - marginRight)) {
    line(map(0, interval[0], interval[1], marginLeft, width - marginRight), marginTop, map(0, interval[0], interval[1], marginLeft, width - marginRight), height - marginBottom);
  }
}

void drawText() {
  stroke(255);
  fill(255);
  textSize(12);
  text(maxmin[1], 0, marginTop);
  text(maxmin[0], 0, height - marginBottom);
  text(interval[0], marginLeft, (height - marginBottom) + (marginBottom / 2));
  text(interval[1], width - marginRight, (height - marginBottom) + (marginBottom / 2));
  
  textSize(50);
  text("∫", 10, 50);
  textSize(12);
  text(interval[0], 30, 55);
  text(interval[1], 35, 22);
  textSize(20);
  text("f(x) dx = " + aproxIntegral, 80, 42);
  
  text("n = " + n, 400, 42);
}

void drawCursor() {
  stroke(255);
  if (mouseX > marginLeft) {
    if (mouseX < width - marginRight) {
      if (mouseY > marginTop) {
        if (mouseY < height - marginBottom) {
          cursorXindex = (int)round(map(mouseX, marginLeft, width - marginRight, 0, n));
          cursorXmapped = mappedPointsX[cursorXindex];
          cursorYmapped = mappedPointsY[cursorXindex];
          
          line(cursorXmapped, marginTop, cursorXmapped, height - marginBottom);
          line(marginLeft, cursorYmapped, width - marginRight, cursorYmapped);
          
          textSize(12);
          text(pfx[cursorXindex], 0, cursorYmapped + 4);
          text(px[cursorXindex], cursorXmapped - 20, (width - marginBottom) + 15);
        }
      }
    }
  }
}

// =============================

void keyPressed() {
  if (key == 'd') {
    interval[0] += 0.1;
    interval[1] += 0.1;
  }
  
  if (key == 'a') {
    interval[0] -= 0.1;
    interval[1] -= 0.1;
  }
  
  if (key == 'w') {
    maxmin[0] += 0.1;
    maxmin[1] += 0.1;
  }
  
  if (key == 's') {
    maxmin[0] -= 0.1;
    maxmin[1] -= 0.1;
  }
  
  
  
  if (key == 'e') {
    interval[0] += 0.1;
    interval[1] -= 0.1;
  }
  
  if (key == 'q') {
    interval[0] -= 0.1;
    interval[1] += 0.1;
  }
  
  
  
  if (key == 'c') {
    maxmin[0] += 0.1;
    maxmin[1] -= 0.1;
  }
  
  if (key == 'z') {
    maxmin[0] -= 0.1;
    maxmin[1] += 0.1;
  }
  
  
  if (key == 'x') {
    n -= 10;
  }
  
  if (key == 'v') {
    n += 10;
    if (n > in) { n = in; }
  }
}
