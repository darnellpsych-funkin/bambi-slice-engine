package funkin.util;

import haxe.io.Bytes;

/**
 * A DDS texture whose top mip level uses a block-compressed format.
 */
typedef DDSTexture =
{
  /**
   * Width of the top mip level, in pixels.
   */
  var width:Int;

  /**
   * Height of the top mip level, in pixels.
   */
  var height:Int;

  /**
   * The FourCC of the format: `DXT1` or `DXT5`.
   */
  var format:String;

  /**
   * The compressed blocks of the top mip level.
   */
  var data:Bytes;
};

/**
 * Reads the top mip level of a DDS file that uses DXT1 or DXT5 (PC compressed textures).
 *
 * Only the legacy 128-byte header is supported. Files with a DX10 header, or any other format,
 * are rejected so the caller can fall back to the PNG.
 */
@:nullSafety
class DDSUtil
{
  static final HEADER_SIZE:Int = 128;

  /**
   * Parses a DDS file and returns its top mip level, or `null` if it is not a supported DXT file.
   */
  public static function parse(bytes:Bytes):Null<DDSTexture>
  {
    if (bytes.length < HEADER_SIZE) return null;
    if (bytes.getString(0, 4) != 'DDS ') return null;
    // The header size field must be 124 bytes.
    if (readInt32(bytes, 4) != 124) return null;

    var height:Int = readInt32(bytes, 12);
    var width:Int = readInt32(bytes, 16);
    if (width <= 0 || height <= 0) return null;

    var format:String = bytes.getString(84, 4);
    var blockBytes:Int = switch (format)
    {
      case 'DXT1': 8;
      case 'DXT5': 16;
      default: 0;
    };
    if (blockBytes == 0) return null;

    var blocksWide:Int = (width + 3) >> 2;
    var blocksHigh:Int = (height + 3) >> 2;
    var dataSize:Int = blocksWide * blocksHigh * blockBytes;
    if (bytes.length < HEADER_SIZE + dataSize) return null;

    return {
      width: width,
      height: height,
      format: format,
      data: bytes.sub(HEADER_SIZE, dataSize),
    };
  }

  /**
   * Reads a little-endian 32-bit integer.
   */
  static function readInt32(bytes:Bytes, pos:Int):Int
  {
    return bytes.get(pos) | (bytes.get(pos + 1) << 8) | (bytes.get(pos + 2) << 16) | (bytes.get(pos + 3) << 24);
  }
}
