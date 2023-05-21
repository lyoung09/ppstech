import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/custom_util.dart';
import 'package:ppstech/resources/text.dart';
import '../../../resources/colors.dart';
import '../../../resources/images.dart';

class ShowStepWidget extends StatelessWidget {
  const ShowStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .85,
      height: 315,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: ColorItems.blueColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetFactory.customSizedBox(height: 7),
          titleText(),
          WidgetFactory.customSizedBox(height: 7),
          subTitleText(),
          WidgetFactory.customSizedBox(height: 12),
          Stack(
            children: [
              Center(
                  child: Stack(
                children: [
                  Positioned(left: 0, child: Images.getImages('home/Vector')),
                  Images.getImages('home/percent'),
                ],
              )),
              Center(
                  child: Stack(
                children: [
                  Images.getImages('home/main_azi_01'),
                  Positioned(
                      left: 0,
                      bottom: 12,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text('0',
                            style: TextItems.textStyle
                                .copyWith(color: ColorItems.white)),
                      )),
                  Positioned(
                      bottom: 12,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Text('100',
                            style: TextItems.textStyle
                                .copyWith(color: ColorItems.white)),
                      ))
                ],
              )),
            ],
          ),
          Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorItems.lightblueColor,
                      fixedSize: const Size(140, 32),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: ColorItems.white),
                          borderRadius: BorderRadius.circular(100))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Images.getImages('icon/azitpoint'),
                      WidgetFactory.customSizedBox(width: 6),
                      Text('휴식하기',
                          style: TextItems.textStyle
                              .copyWith(color: ColorItems.white, fontSize: 14)),
                      WidgetFactory.customSizedBox(width: 6),
                      Text('25',
                          style: TextItems.boldStyle
                              .copyWith(color: ColorItems.white, fontSize: 14))
                    ],
                  ))),
        ],
      ),
    );
  }

  Widget titleText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Images.getImages('home/pin-location-mono'),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: '현재 ',
              style: TextItems.boldStyle
                  .copyWith(color: ColorItems.lightblueColor)),
          TextSpan(
              text: '강남구 서초동 체크인',
              style: TextItems.boldStyle.copyWith(color: ColorItems.white)),
        ]))
      ],
    );
  }

  Widget subTitleText() {
    return Center(
        child: WidgetFactory.customBetweenText(
            '오늘의 걸음 수는 ${CustomUtil.numToText(5000)}이에요.',
            CustomUtil.numToText(5000),
            TextItems.textStyle
                .copyWith(fontSize: 12, color: ColorItems.lightblueColor),
            TextItems.boldStyle
                .copyWith(fontSize: 12, color: ColorItems.white)));
  }
}
