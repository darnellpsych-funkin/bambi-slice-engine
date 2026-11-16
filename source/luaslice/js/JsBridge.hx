package luaslice.js;

/**
 * Extern binding for the QuickJS bridge in native/quickjs. The C sources are compiled
 * through project/Build.xml, which the LinkerMacro adds to this class's build.
 */
#if !macro
@:build(funkin.util.macro.LinkerMacro.xml('project/Build.xml'))
@:include('js_bridge.h')
extern class JsBridge
{
  @:native('bambi_js_new')
  static function newState():cpp.RawPointer<cpp.Void>;

  @:native('bambi_js_free')
  static function freeState(state:cpp.RawPointer<cpp.Void>):Void;

  @:native('bambi_js_eval')
  static function eval(state:cpp.RawPointer<cpp.Void>, source:cpp.ConstCharStar, name:cpp.ConstCharStar):Int;
}
#end
