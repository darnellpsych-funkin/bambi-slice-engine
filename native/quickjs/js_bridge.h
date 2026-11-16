#ifndef BAMBI_JS_BRIDGE_H
#define BAMBI_JS_BRIDGE_H

/* Opaque handle: one JavaScript runtime and context per script state. */
typedef struct BambiJsState BambiJsState;

/* Creates a runtime with a `print` global that writes to stdout. Returns NULL on failure. */
BambiJsState *bambi_js_new(void);
void bambi_js_free(BambiJsState *state);

/*
 * Evaluates `source` as a classic script named `name`.
 * Returns 0 on success. On failure, prints the error to stderr and returns -1.
 */
int bambi_js_eval(BambiJsState *state, const char *source, const char *name);

#endif
