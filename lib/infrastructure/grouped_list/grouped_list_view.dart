
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupedListView extends StatelessWidget {

  final String title;
  final List<ListItem> elements;

  const GroupedListView({
    required this.title,
    required this.elements,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            titlePadding: const EdgeInsets.all(16),
            centerTitle: false,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return elements[index].build(context);
          }, childCount: elements.length),
        ),
      ],
    );
  }

}