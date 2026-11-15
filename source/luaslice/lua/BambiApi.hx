package luaslice.lua;

/**
 * Bambi-Slice functions exposed to Lua scripts as the global `Bambi` table.
 *
 * Lua reaches these through the single `bambiApi(action, value)` function, which
 * dispatches on `action`. Unknown actions return nil.
 */
@:nullSafety
class BambiApi
{
  public static function call(action:String, value:Dynamic):Dynamic
  {
    return switch (action)
    {
      case 'version':
        funkin.util.Constants.VERSION;

      case 'lang.current':
        funkin.util.Translations.currentLanguage();

      case 'lang.tr':
        funkin.util.Translations.tr(Std.string(value));

      case 'botplay.get':
        funkin.Preferences.botPlay;

      case 'botplay.set':
      {
        funkin.Preferences.botPlay = (value == true);
        funkin.Preferences.botPlay;
      }

      case 'ghostTap.mode':
        funkin.Preferences.ghostTapMode;

      default:
        null;
    };
  }
}
