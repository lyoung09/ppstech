import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/custom_util.dart';
import 'package:ppstech/data/data.dart';
import 'package:ppstech/resources/text.dart';
import 'package:ppstech/screen/pointshop/pointshop.dart';
import '../../../model/item.dart';
import '../../../resources/colors.dart';
import '../../../resources/images.dart';

class PointShopWidget extends StatelessWidget {
  const PointShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .85,
      height: 375,
      padding: const EdgeInsets.only(left: 28, right: 28),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        pointshopTitle(),
        WidgetFactory.customSizedBox(height: 12),
        subtitleText(),
        WidgetFactory.customSizedBox(height: 12),
        purchaseList(context),
        WidgetFactory.customSizedBox(height: 24),
        shortcuts(context)
      ]),
    );
  }

  Widget pointshopTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('포인트샾',
            style: TextItems.boldStyle.copyWith(
                fontSize: 12, color: ColorItems.blueColor, height: 1.8)),
        const Spacer(),
        Images.getImages('icon/refresh-mono')
      ],
    );
  }

  Widget subtitleText() {
    return Container(
      width: 223,
      alignment: Alignment.centerLeft,
      child: Text('차곡차곡 모은 포인트로\n 다른 사람들은 아래 상품 구매했어요',
          style: TextItems.boldStyle.copyWith(fontSize: 16, height: 1.8)),
    );
  }

  Widget purchaseList(context) {
    List<ItemModel> items = MyData.getItemData();
    List<ItemModel> pointItems = [];
    pointItems.add(items.firstWhere((element) => element.shopName == '빽다방'));
    pointItems.add(items.firstWhere((element) => element.shopName == 'GS25'));
    pointItems
        .add(items.firstWhere((element) => element.shopName == '네이버페이 포인트쿠폰'));

    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: pointItems.map((e) => purchaseListtile(context, e)).toList());
  }

  Widget shortcuts(context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PointShopScreen()),
          );
        },
        child: Container(
          width: 278,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: ColorItems.gray020)),
          child: Center(
              child: Text('포인트샵 바로가기',
                  style: TextItems.textStyle.copyWith(fontSize: 16))),
        ));
  }

  Widget purchaseListtile(context, ItemModel item) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Images.getImages(item.image, width: 40, height: 40),
        title: Text(item.shopName,
            style: TextItems.textStyle
                .copyWith(fontSize: 10, color: ColorItems.extraColor)),
        subtitle: Text(item.name,
            style: TextItems.textStyle
                .copyWith(fontSize: 14, color: ColorItems.primary)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(CustomUtil.numToText(item.point),
                style: TextItems.boldStyle
                    .copyWith(fontSize: 14, color: ColorItems.pointColor)),
            WidgetFactory.customSizedBox(width: 4),
            Images.getImages('icon/azitpoint')
          ],
        ),
      ),
    );
  }
}
