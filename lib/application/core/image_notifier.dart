import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:gallery_test_task/domain/models/image_model.dart';

class ImageNotifier extends ChangeNotifier{
  List<ImageModel> imageModels = [];


  String getUrl(int page, {String query = 'car'}) {
    return 'https://api.unsplash.com/search/photos?page=$page&per_page=30&client_id=tZ53x_MgSn7Q0rh9HNWFkOC9nPLVqXL0T77iNilmD1U&query=$query';
  }

  Future<List<ImageModel>> getData(int page, String query) async {
    try {
      String url = getUrl(page);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);
        final List<dynamic> listMap = jsonData['results'];
        return addToList(listMap);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Future.error(e);
    }
  }

  List<ImageModel> addToList(List<dynamic> addList) {
    List<ImageModel> newImageList = [];
    newImageList =
        addList.map<ImageModel>((json) => ImageModel.fromJson(json)).toList();
    return newImageList;
  }
}

final imageNotifier = ChangeNotifierProvider<ImageNotifier>((ref) {
  return ImageNotifier();
});