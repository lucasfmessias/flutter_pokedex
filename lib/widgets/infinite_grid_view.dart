import 'package:flutter/material.dart';

class InfiniteGridView extends StatefulWidget {
  final int crossAxisCount;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool hasNext;
  final double scrollExtent;
  final Function() nextData;
  final EdgeInsets padding;

  const InfiniteGridView({
    Key key,
    this.itemCount,
    this.itemBuilder,
    this.hasNext,
    this.nextData,
    this.scrollExtent = 0.6,
    this.crossAxisCount = 2,
    this.padding = const EdgeInsets.all(10.0),
  }) : super(key: key);

  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  ScrollController _scrollController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onScrollListener() async {
    final currentScroll = _scrollController.position.pixels;
    final maxScroll =
        _scrollController.position.maxScrollExtent * widget.scrollExtent;
    if (!loading && currentScroll >= maxScroll) {
      loading = true;
      await widget.nextData();
      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0) {
      return Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          _buildGridView(),
          _buildNextDataLoading(),
        ],
      ),
    );
  }

  _buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: widget.padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
      ),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }

  _buildNextDataLoading() {
    if (widget.hasNext) {
      return Container(
        height: 100.0,
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox();
  }
}
