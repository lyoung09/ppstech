import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import '../../../resources/colors.dart';
import '../../../resources/images.dart';
import '../../../resources/text.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customContainer('일일미션', '돌림판 돌리고 최대 500P 받기', 'home/bullseye', context,
            changeText: '500P'),
        customContainer(
            '휴식하기', '아지트에서 특별한 휴식을 경험하세요!', 'home/ringed_planet', context,
            textNew: 'NEW'),
      ],
    );
  }

  Widget customContainer(
      String title, String subTitle, String icon, BuildContext context,
      {String? textNew, String? changeText}) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .85,
      height: 82,
      padding: const EdgeInsets.only(left: 28, right: 28),
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Images.getImages(icon)),
          WidgetFactory.customSizedBox(width: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextItems.boldStyle.copyWith(
                      color: ColorItems.blueColor, fontSize: 18, height: 1.8)),
              WidgetFactory.customSizedBox(height: 4),
              changeText == null
                  ? Text(subTitle,
                      style: TextItems.textStyle.copyWith(
                        color: ColorItems.darkGrayColor,
                        fontSize: 12,
                      ))
                  : WidgetFactory.customBetweenText(
                      subTitle,
                      changeText,
                      TextItems.textStyle.copyWith(
                        color: ColorItems.darkGrayColor,
                        fontSize: 12,
                      ),
                      TextItems.boldStyle.copyWith(
                        fontSize: 12,
                      )),
            ],
          ),
          const Spacer(),
          textNew != null
              ? Column(
                  children: [
                    Text(textNew,
                        style: TextItems.boldStyle.copyWith(
                            fontSize: 12, color: ColorItems.blueColor)),
                    Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Images.getImages(
                          'icon/arrow_right',
                        )),
                  ],
                )
              : Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Images.getImages(
                    'icon/arrow_right',
                  )),
        ],
      ),
    );
  }
}
