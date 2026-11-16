#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "quickjs.h"
#include "js_bridge.h"

struct BambiJsState {
  JSRuntime *rt;
  JSContext *ctx;
};

BambiJsState *bambi_js_new(void) {
  BambiJsState *state = malloc(sizeof(BambiJsState));
  if (!state) return NULL;
  state->rt = JS_NewRuntime();
  if (!state->rt) { free(state); return NULL; }
  state->ctx = JS_NewContext(state->rt);
  if (!state->ctx) { JS_FreeRuntime(state->rt); free(state); return NULL; }
  return state;
}

void bambi_js_free(BambiJsState *state) {
  if (!state) return;
  JS_FreeContext(state->ctx);
  JS_FreeRuntime(state->rt);
  free(state);
}

static void copy_exception(JSContext *ctx, char *err, size_t err_len) {
  if (!err || err_len == 0) return;
  JSValue exc = JS_GetException(ctx);
  const char *msg = JS_ToCString(ctx, exc);
  snprintf(err, err_len, "%s", msg ? msg : "unknown JavaScript error");
  if (msg) JS_FreeCString(ctx, msg);
  JS_FreeValue(ctx, exc);
}

int bambi_js_eval(BambiJsState *state, const char *source, const char *name, char *err, size_t err_len) {
  if (!state || !state->ctx) {
    if (err && err_len) snprintf(err, err_len, "JavaScript runtime not available");
    return -1;
  }
  JSValue result = JS_Eval(state->ctx, source, strlen(source), name, JS_EVAL_TYPE_GLOBAL);
  if (JS_IsException(result)) {
    copy_exception(state->ctx, err, err_len);
    JS_FreeValue(state->ctx, result);
    return -1;
  }
  JS_FreeValue(state->ctx, result);
  return 0;
}
