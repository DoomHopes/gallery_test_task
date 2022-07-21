import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:gallery_test_task/domain/models/image_model.dart';

class ImageNotifier extends ChangeNotifier {
  List<ImageModel> imageModels = [];

  String getUrl(int page, {String query = 'car'}) {
    return 'https://api.unsplash.com/search/photos?page=$page&per_page=10&client_id=tZ53x_MgSn7Q0rh9HNWFkOC9nPLVqXL0T77iNilmD1U&query=$query';
  }

  Future<void> getData(int page) async {
    try {
      String url = getUrl(page);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);
        final List<dynamic> listMap = jsonData['results'];
        imageModels += listMap
            .map<ImageModel>((json) => ImageModel.fromJson(json))
            .toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Future.error(e);
    }
  }
}

final imageNotifier = ChangeNotifierProvider<ImageNotifier>((ref) {
  return ImageNotifier();
});
