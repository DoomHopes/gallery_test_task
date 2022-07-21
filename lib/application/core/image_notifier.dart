import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageNotifier extends ChangeNotifier{
  
}

final imageNotifier = ChangeNotifierProvider<ImageNotifier>((ref) {
  return ImageNotifier();
});