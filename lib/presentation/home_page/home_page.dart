import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery_test_task/domain/models/image_model.dart';

import '../../application/core/image_notifier.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    ref.read(imageNotifier).getData(_page);
    List<ImageModel> images = ref.watch(imageNotifier).imageModels;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return ref.read(imageNotifier).getData(_page);
        },
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            if (images.isNotEmpty) {
              return ListTile(
                title: Image.network(images[index].urls.small!),
                subtitle: Text('Author: ${images[index].user.firstName!}'),
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
