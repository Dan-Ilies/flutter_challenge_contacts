
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_delegate.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_item.dart';
import 'package:challenge_about_you/theme/images.dart';
import 'package:challenge_about_you/theme/text_styles.dart';
import 'package:flutter/material.dart';

// We need this as a StatefulWidget
// just for displaying and hiding the header and footer
class GroupedListView extends StatefulWidget {

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
  State<GroupedListView> createState() => _GroupedListViewState();
}

class _GroupedListViewState extends State<GroupedListView> {

  bool _showHeaderFooter = true;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: CustomScrollView(
        slivers: [
          _appBar(context),
          _sliverToBoxAdapter(widget.header),
          if (widget.items.isEmpty)
            _emptyListPlaceholder()
          else
            _listItems(context),
          _sliverToBoxAdapter(widget.footer),
        ],
      ),
      onRefresh: () async {
        widget.groupedListDelegate.didRefresh(context);
      },
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 100,
      title: Text(widget.title),
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
              onChanged: (text) {
                _showHeaderFooter = text.isEmpty;
                widget.groupedListDelegate.didSearch(context, text);
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
        return widget.items[index].build(context);
      }, childCount: widget.items.length),
    );
  }

  Widget _emptyListPlaceholder() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Image.asset(AppImages.searchEmpty),
          const SizedBox(height: 12),
          Text(
            'No results',
            style: AppTextStyles.mainText(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _sliverToBoxAdapter(Widget? widget) {
    Widget widgetToDisplay;
    if (_showHeaderFooter && widget != null) {
      widgetToDisplay = widget;
    } else {
      widgetToDisplay = const SizedBox.shrink();
    }
    return SliverToBoxAdapter(child: widgetToDisplay);
  }
}