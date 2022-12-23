import 'dart:math';

class RandomImageGenerator {
  // static var a = Directory('assets/images').listSync();
  static List<String> images =
      List.generate(6, (index) => "assets/dress_images/${index + 1}.jpg");

  static String randomImage() {
    // print(a.length);
    return images[Random().nextInt(images.length)];
  }
}
