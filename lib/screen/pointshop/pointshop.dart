import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/custom_util.dart';
import 'package:ppstech/data/data.dart';
import 'package:ppstech/resources/text.dart';
import 'package:ppstech/screen/pointshop/widget/grid_category.dart';
import '../../resources/colors.dart';
import '../../resources/images.dart';

class PointShopScreen extends StatelessWidget {
  const PointShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetFactory.customAppBar(context, '포인트샾', action: '구매내역'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetFactory.customSizedBox(height: 32),
              customText(),
              WidgetFactory.customSizedBox(height: 8),
              customRichText(),
              WidgetFactory.customSizedBox(height: 48),
              const GridCategoryWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget customText() {
    return Text('현재 ${CustomUtil.numToText(MyData.getUser().point)}P 보유 중이에요',
        style: TextItems.boldStyle.copyWith(fontSize: 22));
  }

  Widget customRichText() {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '어떤 상품',
          style: TextItems.boldStyle
              .copyWith(fontSize: 22, color: ColorItems.blueColor)),
      TextSpan(
          text: '을 구매할까요?', style: TextItems.boldStyle.copyWith(fontSize: 22)),
      WidgetSpan(
        child: Images.getImages('icon/money-face'),
      ),
    ]));
  }
}
