import 'package:flutter/material.dart';
import 'package:time_tracker/ui/components/list/group_view/group_model.dart';

typedef HeaderBuilder = Widget Function(int sectionIndex);
typedef ItemBuilder = Widget Function(int sectionIndex, int itemIndex);

class GroupView<Header, Item> extends StatelessWidget {
  const GroupView({
    super.key,
    required this.groupList,
    required this.headerBuilder,
    required this.itemBuilder,
  });

  final List<GroupModel> groupList;
  final HeaderBuilder headerBuilder;
  final ItemBuilder itemBuilder;

  List<Widget> _buildList() {
    List<Widget> slivers = [];

    for (int i = 0; i < groupList.length; i++) {
      slivers.addAll([
        SliverToBoxAdapter(
          child: headerBuilder(i),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: groupList[i].itemList.length,
            (context, j) => itemBuilder(i, j),
          ),
        ),
      ]);
    }

    return slivers;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _buildList(),
    );
  }
}
