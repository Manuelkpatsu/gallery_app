import 'package:flutter/material.dart';
import 'package:gallery_app/locator.dart';
import 'package:gallery_app/model/photo.dart';
import 'package:gallery_app/repository/photo_repository.dart';
import 'package:gallery_app/screen/widget/empty_list_indicator.dart';
import 'package:gallery_app/screen/widget/error_indicator.dart';
import 'package:gallery_app/screen/widget/photo_tile.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pagingController = PagingController<int, Photo>(firstPageKey: 1);
  static const _pageSize = 30;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _getPhotos(pageKey);
    });
    super.initState();
  }

  Future<void> _getPhotos(int pageKey) async {
    try {
      final photos = await get<PhotoRepository>().getPhotos(page: 1, perPage: _pageSize);
      final isLastPage = photos.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(photos);
      } else {
        final nextPageKey = pageKey + photos.length;
        _pagingController.appendPage(photos, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
      get<Logger>().e(error);
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gallery App'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: PagedMasonryGridView<int, Photo>.count(
          pagingController: _pagingController,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          builderDelegate: PagedChildBuilderDelegate<Photo>(
            itemBuilder: (ctx, photo, index) => PhotoTile(photo: photo),
            firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
              error: _pagingController.error,
              onTryAgain: () => _pagingController.refresh(),
            ),
            noItemsFoundIndicatorBuilder: (context) => const EmptyListIndicator(),
          ),
        ),
      ),
    );
  }
}
