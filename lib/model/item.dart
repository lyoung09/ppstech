class ItemModel {
  final int categoryIndex;
  final String image;
  final String name;
  final String shopName;
  final int point;
  int? salePercent;
  int? shopIndex;
  int? price;

  ItemModel(
      this.categoryIndex, this.image, this.name, this.shopName, this.point,
      {this.salePercent, this.shopIndex, this.price});
}
