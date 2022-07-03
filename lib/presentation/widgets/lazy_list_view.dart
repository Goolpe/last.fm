import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/presentation/widgets/loading_indicator.dart';
import 'package:appsfactory_test/presentation/widgets/text_with_button.dart';
import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LazyListView<T> extends StatefulWidget {
  const LazyListView({
    required this.onFetchPage,
    required this.onEmpty,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.padding,
    super.key,
  });

  final Future<Either<Failure, List<T>>> Function(int page) onFetchPage;
  final Widget Function(BuildContext context) onEmpty;
  final Widget Function (T item, int index) itemBuilder;
  final Widget Function(BuildContext, int) separatorBuilder;
  final EdgeInsetsGeometry? padding;

  @override
  State<LazyListView<T>> createState() => _LazyListViewState<T>();
}

class _LazyListViewState<T> extends State<LazyListView<T>> {

  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);
  
  int currentPage = 0;
  final int limit = 30;

  @override
  void initState() {
    _pagingController.addPageRequestListener((int pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final Either<Failure, List<T>> result = await widget.onFetchPage(currentPage + 1);

    result.fold(
      (Failure failure){
        _pagingController.error = failure.message;
      }, (List<T> newItems){
        currentPage++;
        final bool isLastPage = newItems.length < limit;

        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final int nextPageKey = pageKey + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scrollbar(
      child: PagedListView<int, T>.separated(
        separatorBuilder: widget.separatorBuilder,
        pagingController: _pagingController,
        padding: widget.padding,
        builderDelegate: PagedChildBuilderDelegate<T>(
          noItemsFoundIndicatorBuilder: (BuildContext context) {
            return widget.onEmpty(context);
          },
          itemBuilder: (BuildContext context, item, int index){
            return widget.itemBuilder(item, index);
          },
          firstPageProgressIndicatorBuilder: _loadingWidget,
          newPageProgressIndicatorBuilder: _loadingWidget,
          firstPageErrorIndicatorBuilder: _errorWidget,
          newPageErrorIndicatorBuilder: _errorWidget,
        ),
      ),
    );
  }

  Widget _errorWidget(BuildContext context){
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return TextWithButton(
      text: _pagingController.error, 
      textButton: locale.tryAgain, 
      onPressed: _pagingController.retryLastFailedRequest,
    );
  }

  Widget _loadingWidget(BuildContext context){
    return const LoadingIndicator();
  }
}
