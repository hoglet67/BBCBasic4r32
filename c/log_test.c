#include <stdio.h>
#include <math.h>

// The range to test over
#define  MIN (0.5 * sqrt(2.0))
#define  MAX (1.0 * sqrt(2.0))
#define STEP ((MAX - MIN) / 1000.0)

typedef double (*function)(double, int);

// The simplest series for log
//
//                          z^2   z^3   z^4
// ln (x) = ln(1 + z) = z - --- + --- - --- - ... )
//                           2     3     4
// x = 1 + z and z = x - 1

double taylor_series_log(double x, int nterms) {
   int i;
   double z = x - 1.0;
   double result = 0.0;
   double sign = 1;
   for (i = 0; i < nterms; i++) {
      double p = i + 1;
      result += sign * pow(z, p) / p;
      sign = -sign;
   }
   return result;
}

// A series using odd power that is faster converging
//
//              1 - z             z^3   z^5   z^7
// ln (x) = ln  -----  =  -2 (z + --- + --- + --- + ... )
//              1 + z              3     5     7
//
//     1 - z          1 - x
// x = ----- and  z = -----
//     1 + z          1 + x

double taylor_odd_series_log(double x, int nterms) {
   int i;
   double z = (1.0 - x) / (1.0 + x);
   double result = 0.0;
   for (i = 0; i < nterms; i++) {
      double p = 1 + 2 * i;
      result += pow(z, p) / p;
   }
   result *= -2.0;
   return result;
}

//
// Follows the implementation in BBC Basic 4r32
//
double bbcbasic4r32_log(double x, int nterms) {
   const double C3 = -1.533333333;
   const double C4 = -0.617142857;
   const double C5 = -1.800000000;
   double b, c, d, e, f, g, h, i, j, k;
   b = (1.0 - x) / (1.0 + x);
   c = 3.0 / (b * b);
   int use_extra = (nterms > 1) || (nterms == 0 && c > 1.21307373E-3);
   if (use_extra) {
      d = C3 + c;
      e = C4 / d;
      f = c + e;
   } else {
      f  = c;
   }
   g = C5 + f;
   h = b / g;
   i = b + h;
   j = 2.0 * i;
   k = -j;
   return k;
}

double evaluate_error(function f, int nterms) {
   double max_err = -1.0;
   for (double x = MIN; x < MAX; x += STEP) {
      double val = f(x, nterms);
      double err = fabs(val - log(x));
      if (err > max_err) {
         max_err = err;
      }
   }
   return max_err;
}

int main() {
   for (int nterms = 1; nterms < 20; nterms ++) {
      printf("Taylor series A with %3d terms: max_err = %e\n",
             nterms, evaluate_error(taylor_series_log, nterms));
   }
   printf("\n");
   for (int nterms = 1; nterms < 20; nterms ++) {
      printf("Taylor series B with %3d terms: max_err = %e\n",
             nterms, evaluate_error(taylor_odd_series_log, nterms));
   }
   printf("\n");
   printf("BBC Basic 4r32 with 1   coeffs: max_err = %e\n",
          evaluate_error(bbcbasic4r32_log, 1));

   printf("BBC Basic 4r32 with 3   coeffs: max_err = %e\n",
          evaluate_error(bbcbasic4r32_log, 3));

   printf("BBC Basic 4r32 with 1/3 coeffs: max_err = %e\n",
          evaluate_error(bbcbasic4r32_log, 0));
   printf("\n");
}
