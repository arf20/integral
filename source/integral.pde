// Definite integral aproximation with equal width rectangles v1.0.
// By Angel Ruiz Fernadez. Started 20/08/2019, Finished 22/08/2019. Murcia, Spain.
// You have permission for using this code for education and scientific purposes.

//  b
// ∫ f(x)dx
//  a

// Move around the plot with w, a, s and d keys. a and d change limits
// Horizontal zoom with q and e keys. This change limits
// Vertical zoom with z and c keys
// Change resolution with x and v keys. Note: this may cause error in integral aproximtion

// With n = 10000, f(x) = sin(x) and limits 0-π this program aproximates its ∫f(x)dx with an error of 9.5*10⁻⁵

int in = 10000;               // Resolution, aka. nº of rectangles. Note: nº of f(x) samples is n+1. The higher n, the higher CPU impact

float interval[] = { 0, PI }; // Definite integral limits
float maxmin[] = { 0, 1 };    // f(x) global maximun and minimun. Needed for proper plotting

// ======================================

int n = in;

float x = 0;
float[] px = new float[n + 1];
float[] pfx = new float[n + 1];

float dx = (interval[1] - interval[0]) / n;
float[] rects = new float[n];

float aproxIntegral = 0;

// ======================================

void setup() {
  size(800, 800);
  background(0);
  
  
  
  for (int i = 0; i <= n; i++) {
    x = map(i, 0, n, interval[0], interval[1]);
    pfx[i] = f(x);
    px[i] = x;
  }
  
  for (int i = 0; i < n; i++) {
    rects[i] = pfx[i + 1] * dx;
  }
  
  for (int i = 0; i < n; i++) {
    aproxIntegral += rects[i];
  }
  
  println(aproxIntegral);
}

void draw() {
  background(0);
  
  aproxIntegral = 0;
  for (int i = 0; i <= n; i++) {
    x = map(i, 0, n, interval[0], interval[1]);
    pfx[i] = f(x);
    px[i] = x;
  }
  
  for (int i = 0; i < n; i++) {
    rects[i] = pfx[i + 1] * dx;
  }
  
  for (int i = 0; i < n; i++) {
    aproxIntegral += rects[i];
  }
  
  drawRects();
  drawLine();
  plotfx();
  drawText();
  drawCursor();
}

// ===================================

float f(float lx) {           // Definition of f(x), in this case, f(x) = sin(x)
  return sin(lx);
  //return -pow(lx, 2) + 1;   // Other commented exampple, f(x) = -x²+1
}
