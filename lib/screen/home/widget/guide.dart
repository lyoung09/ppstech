import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import '../../../resources/colors.dart';
import '../../../resources/images.dart';
import '../../../resources/text.dart';

class GuideWidget extends StatelessWidget {
  const GuideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .85,
      decoration: BoxDecoration(
        color: ColorItems.primary,
        borderRadius: BorderRadius.circular(18.0),
      ),
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          WidgetFactory.customSizedBox(width: 20),
          eventText(),
          const Spacer(),
          Images.getImages('home/man_tipping_hand2'),
          WidgetFactory.customSizedBox(width: 20),
        ],
      ),
    );
  }

  Widget eventText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('새로원지 아지트, 어떻게 사용하나요?',
            style: TextItems.textStyle.copyWith(
                fontSize: 12, height: 1.8, color: ColorItems.gray020)),
        Text('아지트 이용가이드',
            style: TextItems.boldStyle
                .copyWith(fontSize: 18, height: 1.8, color: ColorItems.white)),
      ],
    );
  }
}
