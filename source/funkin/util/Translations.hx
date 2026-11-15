package funkin.util;

/**
 * Minimal translation table for UI text.
 *
 * Keys are the English source strings, so an untranslated key falls back to English.
 * The active language comes from `Preferences.language` (one of `LANGUAGES`).
 */
@:nullSafety
class Translations
{
  /**
   * Language codes, in the order they appear in the language option.
   */
  public static final LANGUAGES:Array<String> = ['en', 'es', 'pt', 'ru'];

  /**
   * Native names of each language, shown in the language option.
   */
  public static final LANGUAGE_NAMES:Map<String, String> = [
    'en' => 'English',
    'es' => 'Español',
    'pt' => 'Português',
    'ru' => 'Русский',
  ];

  /**
   * Translations: English key -> (language code -> text).
   */
  static final TABLE:Map<String, Map<String, String>> = [
    'Naughtyness' => [
      'es' => 'Contenido subido de tono',
      'pt' => 'Conteúdo impróprio',
      'ru' => 'Грубый контент',
    ],
    'When enabled, raunchy content (such as swearing, etc.) is displayed.' => [
      'es' => 'Si está activado, se muestra contenido subido de tono (como groserías, etc.).',
      'pt' => 'Quando ativado, conteúdo impróprio (como palavrões, etc.) é exibido.',
      'ru' => 'Если включено, отображается грубый контент (например, ругательства).',
    ],
    'Downscroll' => [
      'es' => 'Desplazamiento hacia abajo',
      'pt' => 'Rolagem para baixo',
      'ru' => 'Нисходящая прокрутка',
    ],
    'When enabled, notes move downwards toward the strumline at the bottom of the screen.' => [
      'es' => 'Si está activado, las notas bajan hacia la línea de flechas en la parte inferior de la pantalla.',
      'pt' => 'Quando ativado, as notas descem em direção à linha de setas na parte inferior da tela.',
      'ru' => 'Если включено, ноты движутся вниз к линии стрелок внизу экрана.',
    ],
    'Middlescroll' => [
      'es' => 'Notas centradas',
      'pt' => 'Rolagem no centro',
      'ru' => 'Центральная прокрутка',
    ],
    'When enabled, your notes are centered and the opponent notes are faded to the sides.' => [
      'es' => 'Si está activado, tus notas se centran y las notas del oponente se difuminan a los lados.',
      'pt' => 'Quando ativado, suas notas ficam centralizadas e as notas do oponente ficam esmaecidas nas laterais.',
      'ru' => 'Если включено, ваши ноты стоят по центру, а ноты соперника приглушены по бокам.',
    ],
    'Motion Blur' => [
      'es' => 'Desenfoque de movimiento',
      'pt' => 'Desfoque de movimento',
      'ru' => 'Размытие движения',
    ],
    'If enabled, scrolling notes have motion blur.\nWARNING: This can cause eye strain or motion sickness.' => [
      'es' => 'Si está activado, las notas en movimiento tienen desenfoque.\nADVERTENCIA: puede causar fatiga visual o mareo.',
      'pt' => 'Se ativado, as notas em movimento têm desfoque.\nATENÇÃO: pode causar cansaço visual ou enjoo.',
      'ru' => 'Если включено, движущиеся ноты имеют размытие.\nВНИМАНИЕ: может вызвать напряжение глаз или укачивание.',
    ],
    'Strumline Background' => [
      'es' => 'Fondo de la línea de flechas',
      'pt' => 'Fundo da linha de setas',
      'ru' => 'Фон линии стрелок',
    ],
    'Show a semi-transparent background behind the strumline.' => [
      'es' => 'Muestra un fondo semitransparente detrás de la línea de flechas.',
      'pt' => 'Mostrar um fundo semitransparente atrás da linha de setas.',
      'ru' => 'Показывать полупрозрачный фон за линией стрелок.',
    ],
    'Touch Cursor' => [
      'es' => 'Cursor táctil',
      'pt' => 'Cursor de toque',
      'ru' => 'Курсор касания',
    ],
    'Show an indicator where you touch the screen.' => [
      'es' => 'Muestra un indicador donde tocas la pantalla.',
      'pt' => 'Mostrar um indicador onde você toca na tela.',
      'ru' => 'Показывать индикатор там, где вы касаетесь экрана.',
    ],
    'Haptics' => [
      'es' => 'Vibración',
      'pt' => 'Vibração',
      'ru' => 'Вибрация',
    ],
    'When enabled, the game plays haptic feedback effects.' => [
      'es' => 'Si está activado, el juego reproduce efectos de vibración háptica.',
      'pt' => 'Quando ativado, o jogo reproduz efeitos de vibração háptica.',
      'ru' => 'Если включено, игра использует тактильную обратную связь.',
    ],
    'Haptics Intensity' => [
      'es' => 'Intensidad de vibración',
      'pt' => 'Intensidade da vibração',
      'ru' => 'Сила вибрации',
    ],
    'Intensity multiplier for all haptic feedback effects.' => [
      'es' => 'Multiplicador de intensidad para todos los efectos de vibración.',
      'pt' => 'Multiplicador de intensidade para todos os efeitos de vibração.',
      'ru' => 'Множитель силы для всей тактильной обратной связи.',
    ],
    'Bot Play' => [
      'es' => 'Modo bot',
      'pt' => 'Bot Play',
      'ru' => 'Авто-игра',
    ],
    'When enabled, songs play themselves with the bot. Bot runs save their score locally.' => [
      'es' => 'Si está activado, las canciones se juegan solas con el bot. Las partidas con bot guardan la puntuación localmente.',
      'pt' => 'Quando ativado, as músicas são jogadas pelo bot. As partidas com bot salvam a pontuação localmente.',
      'ru' => 'Если включено, песни играются сами с помощью бота. Результаты с ботом сохраняют счёт локально.',
    ],
    'Pause on Unfocus' => [
      'es' => 'Pausar al perder el foco',
      'pt' => 'Pausar ao perder o foco',
      'ru' => 'Пауза при потере фокуса',
    ],
    'When enabled, the game automatically pauses when losing focus.' => [
      'es' => 'Si está activado, el juego se pausa automáticamente al perder el foco.',
      'pt' => 'Quando ativado, o jogo pausa automaticamente ao perder o foco.',
      'ru' => 'Если включено, игра автоматически ставится на паузу при потере фокуса.',
    ],
    'Launch in Fullscreen' => [
      'es' => 'Iniciar en pantalla completa',
      'pt' => 'Iniciar em tela cheia',
      'ru' => 'Запуск в полноэкранном режиме',
    ],
    'When enabled, the game automatically starts up in fullscreen mode.' => [
      'es' => 'Si está activado, el juego se inicia automáticamente en pantalla completa.',
      'pt' => 'Quando ativado, o jogo inicia automaticamente em tela cheia.',
      'ru' => 'Если включено, игра автоматически запускается в полноэкранном режиме.',
    ],
    'Hide Mouse' => [
      'es' => 'Ocultar el ratón',
      'pt' => 'Ocultar mouse',
      'ru' => 'Скрывать мышь',
    ],
    'When enabled, the mouse is hidden while taking a screenshot.' => [
      'es' => 'Si está activado, el ratón se oculta al tomar una captura.',
      'pt' => 'Quando ativado, o mouse fica oculto ao tirar uma captura de tela.',
      'ru' => 'Если включено, мышь скрывается при создании скриншота.',
    ],
    'Fancy Preview' => [
      'es' => 'Vista previa elegante',
      'pt' => 'Pré-visualização elegante',
      'ru' => 'Красивый предпросмотр',
    ],
    'When enabled, a preview is shown after taking a screenshot.' => [
      'es' => 'Si está activado, se muestra una vista previa después de tomar una captura.',
      'pt' => 'Quando ativado, uma pré-visualização é mostrada após tirar uma captura de tela.',
      'ru' => 'Если включено, после скриншота показывается предпросмотр.',
    ],
    'Preview on Save' => [
      'es' => 'Vista previa al guardar',
      'pt' => 'Pré-visualizar ao salvar',
      'ru' => 'Предпросмотр при сохранении',
    ],
    'When enabled, the preview is only shown after a screenshot is saved.' => [
      'es' => 'Si está activado, la vista previa solo se muestra después de guardar la captura.',
      'pt' => 'Quando ativado, a pré-visualização só é mostrada depois que a captura de tela é salva.',
      'ru' => 'Если включено, предпросмотр показывается только после сохранения скриншота.',
    ],
    'Discord RPC' => [
      'es' => 'Discord RPC',
      'pt' => 'Discord RPC',
      'ru' => 'Discord RPC',
    ],
    'Toggles Discord RPC.' => [
      'es' => 'Activa o desactiva Discord RPC.',
      'pt' => 'Ativa ou desativa o Discord RPC.',
      'ru' => 'Включает или выключает Discord RPC.',
    ],
    'Language' => [
      'es' => 'Idioma',
      'pt' => 'Idioma',
      'ru' => 'Язык',
    ],
    'Choose the language of the interface.' => [
      'es' => 'Elige el idioma de la interfaz.',
      'pt' => 'Escolha o idioma da interface.',
      'ru' => 'Выберите язык интерфейса.',
    ],
  ];

  /**
   * Returns the text for `key` in the given language, or the English key if there is no translation.
   */
  public static function tr(key:String, ?language:String):String
  {
    var lang:String = language ?? currentLanguage();
    if (lang == 'en') return key;
    var entry = TABLE.get(key);
    if (entry == null) return key;
    return entry.get(lang) ?? key;
  }

  /**
   * The active language code. Falls back to English when settings are unavailable.
   */
  public static function currentLanguage():String
  {
    var lang:String = funkin.Preferences.language;
    return LANGUAGES.contains(lang) ? lang : 'en';
  }

  /**
   * The TTF font that can draw the active language's characters.
   * Russian needs a font with Cyrillic glyphs; the other languages use the default UI font.
   */
  public static function fontPath():String
  {
    return currentLanguage() == 'ru' ? 'ui/fonts/5by7' : 'ui/fonts/VCR OSD Mono';
  }
}
