class GroupModel<Header, Item> {
  GroupModel({
    required this.data,
    List<Item>? itemList,
  }) : itemList = itemList ?? const [];

  Header data;
  List<Item> itemList;
}
