#include "__fc_builtin.h"
#include "limits.h"

_Bool __FRAMAC_error = 0;

// extern void Frama_C_assert(int);
// #define __FRAMAC_assume(x) Frama_C_assert(x)
#define __FRAMAC_assume(x) while(!(x))
#define __FRAMAC_assert(x) if (!(x)) __FRAMAC_error = 1;

#define __VERIFIER_nondet_bool() Frama_C_nondet(0, 1)
#define __VERIFIER_nondet_int() Frama_C_int_interval(INT_MIN, INT_MAX)
#define __VERIFIER_nondet_uint() Frama_C_unsigned_int_interval(0, UINT_MAX)
#define __VERIFIER_nondet_char() Frama_C_char_interval(CHAR_MIN, CHAR_MAX)
#define __VERIFIER_nondet_uchar() Frama_C_unsigned_char_interval(0, UCHAR_MAX)
