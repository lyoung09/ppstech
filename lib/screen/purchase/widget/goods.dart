import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/resources/colors.dart';
import 'package:ppstech/resources/text.dart';
import '../../../model/item.dart';
import '../../../resources/images.dart';

class GoodsWidget extends StatelessWidget {
  final ItemModel item;

  const GoodsWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 78,
      width: 319,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.shopName,
              style: TextItems.textStyle.copyWith(
                  color: ColorItems.detailShopTextColor, fontSize: 14)),
          Text(item.name, style: TextItems.boldStyle.copyWith(fontSize: 18)),
          WidgetFactory.customSizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              item.salePercent != null
                  ? Text('${item.salePercent.toString()}%',
                      style: TextItems.boldStyle.copyWith(
                          color: ColorItems.percentColor, fontSize: 18))
                  : const SizedBox(),
              WidgetFactory.customSizedBox(width: 5),
              Text(item.point.toString(),
                  style: TextItems.boldStyle
                      .copyWith(color: ColorItems.pointColor, fontSize: 18)),
              WidgetFactory.customSizedBox(width: 5),
              Images.getImages('icon/icon-point-circle-mono'),
              WidgetFactory.customSizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(item.price == null ? '' : item.price.toString(),
                    style: TextItems.textStyle.copyWith(
                        color: ColorItems.notChooseColor,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
