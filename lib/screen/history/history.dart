import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/dao/history_helper.dart';
import 'package:ppstech/model/user.dart';
import 'package:ppstech/resources/colors.dart';
import 'package:ppstech/resources/text.dart';
import 'package:ppstech/screen/history/widget/history_list.dart';
import '../../resources/images.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetFactory.customAppBar(context, '구매내역'),
        body: FutureBuilder(
            future: HistoryDao.getItems(),
            builder: (context, AsyncSnapshot<List<HistoryModel>> snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Images.getImages('image/empty_history'),
                      WidgetFactory.customSizedBox(height: 16),
                      Text('아직 구매내역이 비어있어요.\n다양한 상품 할인 받고 구매해보세요.',
                          textAlign: TextAlign.center,
                          style: TextItems.lightStyle.copyWith(
                              fontSize: 14,
                              height: 1.8,
                              color: ColorItems.detailShopTextColor))
                    ],
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: HistoryListWidget(histories: snapshot.data!),
              );
            }));
  }
}
