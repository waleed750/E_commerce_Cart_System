//! Based file path that has all images.
// ignore_for_file: library_private_types_in_public_api

const _filePath = "assets/images";

class AppImages {
  static _AppImagesPNG png = _AppImagesPNG();
  // static _AppImagesGIF gif = _AppImagesGIF();
  static _AppImagesSVG svg = _AppImagesSVG();
  // static _AppImagesJSON json = _AppImagesJSON();
  // static _AppImagesJPG jpg = _AppImagesJPG();
}

class _AppImagesPNG {
  ///png file path that has image has type [PNG]
  static String _filePathPNG(v) => "$_filePath/png/$v.png";
  String logo = _filePathPNG('logo');
  //? add file path like 👇
  // String test = _filePathPNG('test');

  final String chair1 = _filePathPNG('chair1');
  final String chair2 = _filePathPNG('chair2');
  final String chair3 = _filePathPNG('chair3');

  final String dcc = _filePathPNG('dcc');
  final String freebuds = _filePathPNG('freebuds');
  final String macbook = _filePathPNG('macbook');
  final String plant1 = _filePathPNG('plant1');
  final String plant2 = _filePathPNG('plant2');
  final String plant3 = _filePathPNG('plant3');
}

// class _AppImagesGIF {
//   ///gif file path that has image has type [GIF]
//   static String _filePathGIF(v) => "$_filePath/gif/$v.gif";
//   // String test = _filePathGIF('test');
// }

// class _AppImagesJSON {
//   ///gif file path that has image has type [JSON]
//   static String _filePathJSON(v) => "$_filePath/json/$v.json";
//   // String test = _filePathJSON('test');
// }

class _AppImagesSVG {
  ///svg file path that has image has type [SVG]
  // static const _filePathSVG = "$_filePath/svg";
  static String _filePathSVG(v) => "$_filePath/svg/$v.svg";
  //? add file path like 👇
  final String chair1 = _filePathSVG('chair1');
  final String chair2 = _filePathSVG('chair2');
  final String chair3 = _filePathSVG('chair3');
  final String chair4 = _filePathSVG('chair4');
  final String chair5 = _filePathSVG('chair5');

}

// class _AppImagesJPG {
//   ///png file path that has image has type [PNG]
//   // static const _filePathPNG = "$_filePath/png";
//   static String _filePathJPG(v) => "$_filePath/jpg/$v.jpg";

//   //? add file path like 👇
//   // String test = _filePathJPG('test');
// }
