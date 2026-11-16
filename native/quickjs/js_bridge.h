#ifndef BAMBI_JS_BRIDGE_H
#define BAMBI_JS_BRIDGE_H

#include <stddef.h>

/* Opaque handle: one JavaScript runtime and context per script state. */
typedef struct BambiJsState BambiJsState;

BambiJsState *bambi_js_new(void);
void bambi_js_free(BambiJsState *state);

/*
 * Evaluates `source` as a classic script named `name`.
 * Returns 0 on success. On failure returns -1 and writes the error message into `err`.
 */
int bambi_js_eval(BambiJsState *state, const char *source, const char *name, char *err, size_t err_len);

#endif
