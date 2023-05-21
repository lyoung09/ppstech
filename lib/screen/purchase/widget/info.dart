import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/resources/images.dart';
import 'package:ppstech/resources/text.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 110,
      width: 319,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('상품정보', style: TextItems.boldStyle.copyWith(fontSize: 14)),
          WidgetFactory.customSizedBox(height: 12),
          customText('icon/mobile_coupon', '모바일 쿠폰'),
          WidgetFactory.customSizedBox(height: 8),
          customText('icon/calender', '구매일로부터 30일 이내 사용 가능'),
          WidgetFactory.customSizedBox(height: 8),
          customText('icon/message', '구매 완료 후 5-10분 내 메시지 발송'),
        ],
      ),
    );
  }

  Widget customText(String icon, String text) {
    return Row(
      children: [
        Images.getImages(icon, width: 16, height: 16),
        WidgetFactory.customSizedBox(width: 5),
        Text(text, style: TextItems.lightStyle.copyWith(fontSize: 12))
      ],
    );
  }
}
