package luaslice.js;

import haxe.io.Path;
import luaslice.lua.LuaScriptManager;
import sys.FileSystem;
import sys.io.File;

/**
 * Runs JavaScript (.js) gameplay scripts through QuickJS. Scripts are found in the same
 * roots as Lua scripts: `global.js` and `scripts/*.js`.
 */
class JsScriptManager
{
  var state:Null<cpp.RawPointer<cpp.Void>>;

  public function new()
  {
    state = JsBridge.newState();
    if (state == null) trace('[JsScriptManager] Could not create the JavaScript runtime');
  }

  /** Runs one script. Returns false if it could not be read or threw an error. */
  public function loadScript(path:String):Bool
  {
    if (state == null) return false;
    if (!FileSystem.exists(path)) return false;

    final source = File.getContent(path);
    final result = JsBridge.eval(state, source, Path.withoutDirectory(path));
    if (result != 0) trace('[JsScriptManager] Failed to run ${path}');
    return result == 0;
  }

  public function destroy():Void
  {
    if (state != null) JsBridge.freeState(state);
    state = null;
  }

  public static function findGameplayScripts():Array<String>
  {
    final paths:Array<String> = [];
    for (root in LuaScriptManager.scriptRoots())
    {
      final global = Path.join([root, 'global.js']);
      if (FileSystem.exists(global) && !paths.contains(global)) paths.push(global);

      final scripts = Path.join([root, 'scripts']);
      if (!FileSystem.isDirectory(scripts)) continue;

      final entries = FileSystem.readDirectory(scripts);
      entries.sort(Reflect.compare);
      for (entry in entries)
      {
        if (!entry.toLowerCase().endsWith('.js')) continue;
        final path = Path.join([scripts, entry]);
        if (!paths.contains(path)) paths.push(path);
      }
    }
    return paths;
  }
}
