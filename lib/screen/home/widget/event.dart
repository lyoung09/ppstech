import 'package:flutter/material.dart';
import '../../../resources/colors.dart';
import '../../../resources/images.dart';
import '../../../resources/text.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * .85,
        height: 212,
        padding: const EdgeInsets.only(left: 28, right: 28),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('이벤트',
                style: TextItems.boldStyle
                    .copyWith(fontSize: 12, color: ColorItems.blueColor)),
            Text('42일간 진행되는 특급 혜택!\n포인트샵 50% 할인 이벤트',
                style: TextItems.boldStyle.copyWith(fontSize: 16, height: 1.8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('1 / 2',
                    style: TextItems.textStyle
                        .copyWith(fontSize: 12, height: 1.8)),
                Images.getImages('home/box')
              ],
            ),
          ],
        ));
  }
}
