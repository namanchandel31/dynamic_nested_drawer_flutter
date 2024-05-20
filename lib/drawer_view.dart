import 'package:dynamic_nested_drawer_flutter/item_model.dart';
import 'package:flutter/material.dart';

class DynamicExpandableTree extends StatefulWidget {
  const DynamicExpandableTree({super.key, required this.inputJson});

  final Map<String, dynamic> inputJson;

  @override
  State<DynamicExpandableTree> createState() => _DynamicExpandableTreeState();
}

class _DynamicExpandableTreeState extends State<DynamicExpandableTree> {
  late final ItemClass itemData;
  @override
  initState() {
    super.initState();
    itemData = ItemClass.fromJson(widget.inputJson);
    // itemData = itemClassFromJson(jsonEncode(widget.inputJson));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        centerTitle: true,
        primary: true,
        elevation: 2,
        title: const Text(
          'Dynamic Drawer Tree',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: _buildLayer(itemData.items, 0),
        ),
      ),
    );
  }
}

List<Widget> _buildLayer(List<Item> items, double paddingLeft) {
  return items.map((item) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: item.items.isEmpty
          ? ListTile(
              title: Text(item.title),
              leading: const Icon(Icons.folder),
            )
          : ExpansionTile(
              iconColor: Colors.grey[700],
              collapsedIconColor: Colors.black87,
              title: Text(item.title),
              leading: item.items.isNotEmpty
                  ? const Icon(Icons.folder)
                  : null, // Optional folder icon
              children:
                  item.items.isNotEmpty ? _buildLayer(item.items, 24) : [],
            ),
    );
  }).toList();
}
