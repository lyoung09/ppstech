class User {
  final int steps;
  final int point;
  final List<HistoryModel> history;

  User(this.steps, this.point, this.history);
}

class HistoryModel {
  final int id;
  final String image;
  final String shopName;
  final String itemName;

  HistoryModel(
      {required this.id,
      required this.image,
      required this.shopName,
      required this.itemName});

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
        id: json['id'],
        image: json['image'],
        shopName: json['shopName'],
        itemName: json['itemName'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'shopName': shopName,
      'itemName': itemName,
    };
  }
}
