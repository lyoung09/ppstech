import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/custom_util.dart';
import 'package:ppstech/data/data.dart';
import 'package:ppstech/screen/home/widget/accumulate.dart';
import 'package:ppstech/screen/home/widget/event.dart';
import 'package:ppstech/screen/home/widget/guide.dart';
import 'package:ppstech/screen/home/widget/home_list.dart';
import 'package:ppstech/screen/home/widget/pointshop_widget.dart';
import 'package:ppstech/screen/home/widget/show_step.dart';
import '../../resources/colors.dart';
import '../../resources/images.dart';
import '../../resources/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              WidgetFactory.customSizedBox(height: 20),
              userPoint(),
              WidgetFactory.customSizedBox(height: 20),
              const ShowStepWidget(),
              WidgetFactory.customSizedBox(height: 20),
              const AccumulateWidget(),
              const HomeListWidget(),
              const PointShopWidget(),
              const EventWidget(),
              const GuideWidget(),
              WidgetFactory.customSizedBox(height: 60),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 48,
          color: ColorItems.blueColor,
          child: Row(
            children: [
              WidgetFactory.customSizedBox(width: 32),
              Text(
                '하루 최대 10P 보너스 포인트 받는 법',
                style: TextItems.boldStyle
                    .copyWith(fontSize: 12, color: ColorItems.white),
              ),
              const Spacer(),
              Images.getImages('icon/arrow_right', color: ColorItems.white),
              WidgetFactory.customSizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget userPoint() {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0),
      child: Row(
        children: [
          Images.getImages('icon/profile_default', width: 24, height: 24),
          WidgetFactory.customSizedBox(width: 8),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '${CustomUtil.numToText(MyData.getUser().point)} P',
                style: TextItems.boldStyle.copyWith(fontSize: 14)),
            TextSpan(
                text: '모았어요!',
                style: TextItems.textStyle.copyWith(fontSize: 14)),
          ])),
          WidgetFactory.customSizedBox(width: 4),
          Images.getImages('icon/arrow_right')
        ],
      ),
    );
  }

  Widget customBottomSheet() {
    return const Row();
  }
}
