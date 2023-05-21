import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/resources/colors.dart';
import 'package:ppstech/resources/text.dart';
import '../../../custom_util.dart';
import '../../../model/item.dart';
import '../../../resources/images.dart';
import '../../purchase/purchase.dart';

class DetailGridViewWidget extends StatelessWidget {
  final List<ItemModel> items;
  const DetailGridViewWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 5,
            mainAxisExtent: 230, // here set custom Height You Want
            childAspectRatio: 1),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          ItemModel item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PurchaseScreen(
                          item: item,
                        )),
              );
            },
            child: Column(
              children: [
                Images.getImages(item.image, width: 151, height: 151),
                WidgetFactory.customSizedBox(height: 3),
                SizedBox(
                  width: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetFactory.customSizedBox(height: 4),
                      Text(item.shopName,
                          style: TextItems.textStyle.copyWith(
                              fontSize: 10, color: ColorItems.extraColor)),
                      WidgetFactory.customSizedBox(height: 4),
                      Text(item.name,
                          maxLines: 1,
                          style: TextItems.textStyle.copyWith(fontSize: 14)),
                      WidgetFactory.customSizedBox(height: 4),
                      Row(
                        children: [
                          Text(CustomUtil.numToText(item.point),
                              style: TextItems.textStyle.copyWith(
                                  fontSize: 14, color: ColorItems.pointColor)),
                          WidgetFactory.customSizedBox(width: 8),
                          Images.getImages('icon/azitpoint')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
