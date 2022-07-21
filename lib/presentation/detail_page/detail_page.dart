import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_test_task/domain/models/image_model.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.imageModel}) : super(key: key);

  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: imageModel.id!,
            child: CachedNetworkImage(
              imageUrl: imageModel.urls.regular!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Author: ${imageModel.user.firstName!}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Created at: ${DateFormat('dd/MM/yyyy, HH:mm').format(DateTime.parse(imageModel.createdAt.toString()))}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Picture resolution: ${imageModel.height!}x${imageModel.width!}'),
          ),
          imageModel.altDescription == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Description: ${imageModel.altDescription!}'),
                ),
        ],
      ),
    );
  }
}
