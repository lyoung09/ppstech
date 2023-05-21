import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/screen/purchase/purchase_fab.dart';
import 'package:ppstech/screen/purchase/widget/goods.dart';
import 'package:ppstech/screen/purchase/widget/info.dart';
import 'package:ppstech/screen/purchase/widget/introduction.dart';
import '../../model/item.dart';
import '../../resources/images.dart';

class PurchaseScreen extends StatelessWidget {
  final ItemModel item;
  const PurchaseScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetFactory.customAppBar(context, '포인트샾'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              WidgetFactory.customSizedBox(height: 24),
              Images.getImages(item.image,
                  width: MediaQuery.of(context).size.width * .85, height: 320),
              WidgetFactory.customSizedBox(height: 24),
              GoodsWidget(item: item),
              WidgetFactory.customSizedBox(height: 24),
              const InfoWidget(),
              WidgetFactory.customSizedBox(height: 24),
              const IntroductionWidget(),
              WidgetFactory.customSizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(item: item),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
