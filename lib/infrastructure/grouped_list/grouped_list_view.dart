
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
          expandedHeight: 100,
          title: Text(title),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            titlePadding: const EdgeInsets.all(16),
            centerTitle: false,
          ),
          bottom: AppBar(
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for something',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
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