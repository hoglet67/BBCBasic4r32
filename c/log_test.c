#include <stdio.h>
#include <math.h>

#define DOUBLE long double

// The range to test over
#define  MIN (0.5 * sqrt(2.0))
#define  MAX (1.0 * sqrt(2.0))
#define STEP ((MAX - MIN) / 1000.0)

typedef DOUBLE (*function)(DOUBLE, int);

// The simplest series for log
//
//                          z^2   z^3   z^4
// ln (x) = ln(1 + z) = z - --- + --- - --- - ... )
//                           2     3     4
// x = 1 + z and z = x - 1

DOUBLE taylor_series_log(DOUBLE x, int nterms) {
   int i;
   DOUBLE z = x - 1.0;
   DOUBLE result = 0.0;
   DOUBLE sign = 1;
   for (i = 0; i < nterms; i++) {
      DOUBLE p = i + 1;
      result += sign * powl(z, p) / p;
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

DOUBLE taylor_odd_series_log(DOUBLE x, int nterms) {
   int i;
   DOUBLE z = (1.0 - x) / (1.0 + x);
   DOUBLE result = 0.0;
   for (i = 0; i < nterms; i++) {
      DOUBLE p = 1 + 2 * i;
      result += powl(z, p) / p;
   }
   result *= -2.0;
   return result;
}

//
// Follows the implementation in BBC Basic 4r32
//
DOUBLE bbcbasic4r32_log(DOUBLE x, int nterms) {
   const DOUBLE C3 = -1.533333333;
   const DOUBLE C4 = -0.617142857;
   const DOUBLE C5 = -1.800000000;
   DOUBLE b, c, d, e, f, g, h, i, j, k;
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

DOUBLE evaluate_error(function f, int nterms) {
   DOUBLE max_err = -1.0;
   for (DOUBLE x = MIN; x < MAX; x += STEP) {
      DOUBLE val = f(x, nterms);
      DOUBLE err = fabsl(val - logl(x));
      if (err > max_err) {
         max_err = err;
      }
   }
   return max_err;
}

int main() {
   for (int nterms = 1; nterms < 20; nterms ++) {
      printf("Taylor series A with %3d terms: max_err = %Le\n",
             nterms, evaluate_error(taylor_series_log, nterms));
   }
   printf("\n");
   for (int nterms = 1; nterms < 20; nterms ++) {
      printf("Taylor series B with %3d terms: max_err = %Le\n",
             nterms, evaluate_error(taylor_odd_series_log, nterms));
   }
   printf("\n");
   printf("BBC Basic 4r32 with 1   coeffs: max_err = %Le\n",
          evaluate_error(bbcbasic4r32_log, 1));

   printf("BBC Basic 4r32 with 3   coeffs: max_err = %Le\n",
          evaluate_error(bbcbasic4r32_log, 3));

   printf("BBC Basic 4r32 with 1/3 coeffs: max_err = %Le\n",
          evaluate_error(bbcbasic4r32_log, 0));
   printf("\n");
}
