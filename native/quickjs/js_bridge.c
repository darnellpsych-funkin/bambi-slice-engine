#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "quickjs.h"
#include "js_bridge.h"

struct BambiJsState {
  JSRuntime *rt;
  JSContext *ctx;
};

/* print(...values): writes the values separated by spaces, then a newline. */
static JSValue js_print(JSContext *ctx, JSValueConst this_val, int argc, JSValueConst *argv) {
  for (int i = 0; i < argc; i++) {
    const char *s = JS_ToCString(ctx, argv[i]);
    if (s) {
      printf("%s%s", i ? " " : "", s);
      JS_FreeCString(ctx, s);
    }
  }
  printf("\n");
  fflush(stdout);
  return JS_UNDEFINED;
}

BambiJsState *bambi_js_new(void) {
  BambiJsState *state = malloc(sizeof(BambiJsState));
  if (!state) return NULL;
  state->rt = JS_NewRuntime();
  if (!state->rt) { free(state); return NULL; }
  state->ctx = JS_NewContext(state->rt);
  if (!state->ctx) { JS_FreeRuntime(state->rt); free(state); return NULL; }

  JSValue global = JS_GetGlobalObject(state->ctx);
  JS_SetPropertyStr(state->ctx, global, "print", JS_NewCFunction(state->ctx, js_print, "print", 1));
  JS_FreeValue(state->ctx, global);
  return state;
}

void bambi_js_free(BambiJsState *state) {
  if (!state) return;
  JS_FreeContext(state->ctx);
  JS_FreeRuntime(state->rt);
  free(state);
}

static void print_exception(JSContext *ctx) {
  JSValue exc = JS_GetException(ctx);
  const char *msg = JS_ToCString(ctx, exc);
  fprintf(stderr, "[JsScriptManager] %s\n", msg ? msg : "unknown JavaScript error");
  if (msg) JS_FreeCString(ctx, msg);
  JS_FreeValue(ctx, exc);
}

int bambi_js_eval(BambiJsState *state, const char *source, const char *name) {
  if (!state || !state->ctx) {
    fprintf(stderr, "[JsScriptManager] JavaScript runtime not available\n");
    return -1;
  }
  JSValue result = JS_Eval(state->ctx, source, strlen(source), name, JS_EVAL_TYPE_GLOBAL);
  if (JS_IsException(result)) {
    print_exception(state->ctx);
    JS_FreeValue(state->ctx, result);
    return -1;
  }
  JS_FreeValue(state->ctx, result);
  return 0;
}
