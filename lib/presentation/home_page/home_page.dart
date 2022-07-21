import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery_test_task/domain/models/image_model.dart';
import 'package:gallery_test_task/presentation/detail_page/detail_page.dart';

import '../../application/core/image_notifier.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    ref.read(imageNotifier).getData(1);

    super.initState();
  }

  Future<void> fetchData() async {
    ref.read(imageNotifier).getData(1);
  }

  @override
  Widget build(BuildContext context) {
    List<ImageModel> images = ref.watch(imageNotifier).imageModels;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return fetchData();
        },
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            if (images.isNotEmpty) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        imageModel: images[index],
                      ),
                    ),
                  );
                },
                title: Hero(
                  tag: images[index].id!,
                  child: CachedNetworkImage(
                    imageUrl: images[index].urls.regular!,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Author: ${images[index].user.firstName!}'),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
