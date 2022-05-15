
import 'package:challenge_about_you/core/contacts_list/contacts_list_screen.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_item.dart';
import 'package:flutter/material.dart';

class GroupedListView extends StatelessWidget {

  final String title;
  final List<ListItem> items;
  final SearchBarDelegate searchDelegate;
  final Widget? header;
  final Widget? footer;

  const GroupedListView({
    required this.title,
    required this.items,
    required this.searchDelegate,
    this.header,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _appBar(context),
        _sliverToBoxAdapter(header),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return items[index].build(context);
          }, childCount: items.length),
        ),
        _sliverToBoxAdapter(footer),
      ],
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
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search ...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (text) => {
                searchDelegate.didSearch(context, text)
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _sliverToBoxAdapter(Widget? widget) {
    return SliverToBoxAdapter(
      child: widget ?? const SizedBox.shrink(),
    );
  }

}