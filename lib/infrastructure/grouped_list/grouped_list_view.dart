
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_delegate.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_item.dart';
import 'package:flutter/material.dart';

class GroupedListView extends StatelessWidget {

  final String title;
  final List<ListItem> items;
  final GroupedListDelegate groupedListDelegate;
  final Widget? header;
  final Widget? footer;

  const GroupedListView({
    Key? key,
    required this.title,
    required this.items,
    required this.groupedListDelegate,
    this.header,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: CustomScrollView(
        slivers: [
          _appBar(context),
          _sliverToBoxAdapter(header),
          _listItems(context),
          _sliverToBoxAdapter(footer),
        ],
      ),
      onRefresh: () async {
        groupedListDelegate.didRefresh(context);
      },
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 100,
      title: Text(title),
      bottom: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: TextField(
              autocorrect: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search ...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (text) => {
                groupedListDelegate.didSearch(context, text)
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _listItems(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return items[index].build(context);
      }, childCount: items.length),
    );
  }

  Widget _sliverToBoxAdapter(Widget? widget) {
    return SliverToBoxAdapter(
      child: widget ?? const SizedBox.shrink(),
    );
  }

}