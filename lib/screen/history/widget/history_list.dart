import 'package:flutter/material.dart';
import '../../../common/widget_factory.dart';
import '../../../model/user.dart';
import '../../../resources/colors.dart';
import '../../../resources/images.dart';
import '../../../resources/text.dart';

class HistoryListWidget extends StatelessWidget {
  final List<HistoryModel> histories;
  const HistoryListWidget({
    Key? key,
    required this.histories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: histories
          .map((e) => Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Images.getImages(e.image),
                    WidgetFactory.customSizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.shopName,
                            style: TextItems.textStyle.copyWith(
                                fontSize: 14,
                                color: ColorItems.detailShopTextColor)),
                        Text(e.itemName,
                            style: TextItems.boldStyle.copyWith(fontSize: 16)),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: ColorItems.white,
                              builder: (context) {
                                return WidgetFactory.customBottomDialog(
                                    context, 633, saveHistory(context));
                              });
                        },
                        child: Images.getImages('icon/icon-download-mono'))
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget saveHistory(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        WidgetFactory.customSizedBox(height: 48),
        Images.getImages('image/mobile_coupon', width: 327, height: 453),
        WidgetFactory.customSizedBox(height: 40),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorItems.blueColor,
                fixedSize: const Size(327, 64),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            onPressed: () {
              Navigator.pop(context);
              WidgetFactory().toast(
                context,
                'icon/oval_success_fill',
                '이미지가 저장되었어요.',
                207,
                53,
              );
            },
            child: Text(
              '이미지 다운로드',
              style: TextItems.textStyle
                  .copyWith(fontSize: 16, color: ColorItems.white),
            )),
        WidgetFactory.customSizedBox(height: 28),
      ],
    );
  }
}
