class ImageConstant {
  static ImageConstant? _instance;

  static ImageConstant get instance {
    if (_instance == null) _instance = ImageConstant._init();
    return _instance!;
  }

  ImageConstant._init();

  String get logo => toPng("Mustafa");

  String toPng(String name) => "asset/image/$name";
}
