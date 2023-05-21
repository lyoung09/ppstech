import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/resources/text.dart';
import '../../../resources/colors.dart';
import '../../../resources/images.dart';

class AccumulateWidget extends StatelessWidget {
  const AccumulateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          boxWidget('바로적립', '0/10', '영상 광고 시청 하고 20P 받기', 'home/movie_camera',
              context,
              changeText: '20P'),
          WidgetFactory.customSizedBox(width: 50),
          boxWidget(
              '미션적립', '무제한', '원하는 미션 골라서 참여하고 포인트받기', 'home/joystick', context),
        ],
      ),
    );
  }

  Widget boxWidget(String title, String count, String subTitle, String icon,
      BuildContext context,
      {String? changeText}) {
    return SizedBox(
      width: 125,
      height: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title,
                  style: TextItems.boldStyle
                      .copyWith(fontSize: 18, color: ColorItems.blueColor)),
              const Spacer(),
              Text(count,
                  style: TextItems.textStyle
                      .copyWith(fontSize: 12, color: ColorItems.extraColor)),
            ],
          ),
          WidgetFactory.customSizedBox(height: 5),
          SizedBox(
            width: 110,
            child: changeText == null
                ? Text(subTitle,
                    style: TextItems.textStyle.copyWith(
                        fontSize: 12,
                        color: ColorItems.darkGrayColor,
                        height: 1.8))
                : WidgetFactory.customBetweenText(
                    subTitle,
                    changeText,
                    TextItems.textStyle.copyWith(
                        fontSize: 12,
                        color: ColorItems.darkGrayColor,
                        height: 1.8),
                    TextItems.boldStyle.copyWith(fontSize: 12, height: 1.8)),
          ),
          WidgetFactory.customSizedBox(height: 20),
          Container(
              alignment: Alignment.bottomRight, child: Images.getImages(icon)),
        ],
      ),
    );
  }
}
