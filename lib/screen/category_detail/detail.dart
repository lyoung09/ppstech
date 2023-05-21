import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/data/data.dart';
import 'package:ppstech/resources/colors.dart';
import 'package:ppstech/resources/text.dart';
import 'package:ppstech/screen/category_detail/widget/grid_item.dart';
import '../../model/cateogory.dart';
import '../../model/item.dart';
import '../../model/shop.dart';
import '../../resources/images.dart';

class CategoryDetailScreen extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetailScreen({super.key, required this.category});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final allShops = MyData.getShopData();
  final allItems = MyData.getItemData();

  late List<ShopModel> shops;
  late List<ItemModel> items;

  String? sorting;
  int? shopIndex;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    shops = allShops
        .where(
            (element) => element.categoryIndex == widget.category.categoryIndex)
        .toList();
    items = allItems
        .where(
            (element) => element.categoryIndex == widget.category.categoryIndex)
        .toList();
    shops.insert(0, ShopModel(0, 0, 'logo/line-three-mono', '카테고리'));

    sorting = '낮은가격순';

    items.sort((a, b) => a.point.compareTo(b.point));
  }

  itemSorting(BuildContext context, String sort, int index) {
    if (sort == '낮은가격순') {
      items.sort((a, b) => a.point.compareTo(b.point));
      setState(() => sorting = '낮은가격순');
    } else if (sort == '높은가격순') {
      items.sort((a, b) => b.point.compareTo(a.point));
      setState(() => sorting = '높은가격순');
    }
    index == 1 ? Navigator.pop(context) : null;
  }

  categorySelect(ShopModel shop) {
    setState(() {
      shopIndex = shop.shopIndex;
      items = allItems
          .where((element) => element.shopIndex == shop.shopIndex)
          .toList();
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetFactory.customAppBar(context, widget.category.title),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            WidgetFactory.customSizedBox(height: 24),
            SizedBox(
              height: 108,
              child: Align(
                alignment: Alignment.centerLeft,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: shops
                      .map((ShopModel e) => GestureDetector(
                            onTap: () {
                              e.categoryIndex == 0
                                  ? showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return WidgetFactory.customBottomDialog(
                                            context, 630, allCategory(context));
                                      },
                                    )
                                  : categorySelect(e);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.all(2),
                                child: Column(
                                  children: [
                                    Container(
                                        width: 48,
                                        height: 48,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18))),
                                        child: Images.getImages(e.logo,
                                            width: 15, height: 15)),
                                    WidgetFactory.customSizedBox(height: 15),
                                    Text(
                                      e.title,
                                      style: TextItems.textStyle
                                          .copyWith(fontSize: 10, height: 1.6),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            WidgetFactory.customSizedBox(height: 12),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return WidgetFactory.customBottomDialog(
                            context, 176, sortingPrice(context));
                      },
                    );
                  },
                  child: SizedBox(
                    width: 100,
                    height: 21,
                    child: Row(
                      children: [
                        Text(sorting!,
                            style: TextItems.textStyle.copyWith(fontSize: 16)),
                        Images.getImages('icon/arrow_down'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            WidgetFactory.customSizedBox(height: 24),
            DetailGridViewWidget(items: items)
          ],
        ),
      ),
    );
  }

  Widget sortingPrice(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () => itemSorting(context, '낮은가격순', 1),
            title: Text(
              '낮은가격순',
              style: TextItems.boldStyle.copyWith(
                  fontSize: 16,
                  color: sorting == '낮은가격순'
                      ? ColorItems.blueColor
                      : ColorItems.notChooseColor),
            ),
            trailing: Images.getImages('icon/check',
                color: sorting == '낮은가격순'
                    ? ColorItems.blueColor
                    : ColorItems.notChooseColor),
          ),
          Divider(
            color: ColorItems.gray020,
          ),
          ListTile(
            onTap: () => itemSorting(context, '높은가격순', 1),
            title: Text('높은가격순',
                style: TextItems.boldStyle.copyWith(
                    fontSize: 16,
                    color: sorting == '높은가격순'
                        ? ColorItems.blueColor
                        : ColorItems.notChooseColor)),
            trailing: Images.getImages('icon/check',
                color: sorting == '높은가격순'
                    ? ColorItems.blueColor
                    : ColorItems.notChooseColor),
          )
        ],
      ),
    );
  }

  Widget allCategory(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(widget.category.title,
                  style: TextItems.boldStyle.copyWith(fontSize: 22)),
              WidgetFactory.customSizedBox(width: 5),
              Images.getImages(widget.category.image),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      items = allItems
                          .where((element) =>
                              element.categoryIndex ==
                              widget.category.categoryIndex)
                          .toList();
                      itemSorting(context, sorting!, 2);
                      shopIndex = 0;
                    });

                    Navigator.pop(context);
                  },
                  child: Text('전체보기',
                      style: TextItems.textStyle.copyWith(fontSize: 16)))
            ],
          ),
          WidgetFactory.customSizedBox(height: 40),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: shops
                  .where((element) => element.categoryIndex != 0)
                  .map((e) => ListTile(
                        onTap: () {
                          categorySelect(e);
                          Navigator.pop(context);
                        },
                        leading:
                            Images.getImages(e.logo, width: 28, height: 12),
                        title: Text(
                          e.title,
                          style: TextItems.textStyle.copyWith(fontSize: 16),
                        ),
                        trailing: Images.getImages('icon/arrow_right',
                            color: shopIndex == e.shopIndex
                                ? ColorItems.primary
                                : ColorItems.gray020),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
