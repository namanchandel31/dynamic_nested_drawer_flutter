import 'dart:convert';

ItemClass itemClassFromJson(String str) => ItemClass.fromJson(json.decode(str));

String itemClassToJson(ItemClass data) => json.encode(data.toJson());

class ItemClass {
  List<Item> items;

  ItemClass({
    required this.items,
  });

  factory ItemClass.fromJson(Map<String, dynamic> json) => ItemClass(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String title;
  List<Item> items;

  Item({
    required this.title,
    required this.items,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
