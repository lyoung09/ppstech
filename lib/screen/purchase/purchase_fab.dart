import 'package:flutter/material.dart';
import 'package:ppstech/dao/history_helper.dart';
import 'package:ppstech/resources/colors.dart';
import '../../common/widget_factory.dart';
import '../../custom_util.dart';
import '../../data/data.dart';
import '../../model/item.dart';
import '../../resources/images.dart';
import '../../resources/text.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final ItemModel item;
  const CustomFloatingActionButton({super.key, required this.item});

  checkPoint(BuildContext context, int myPoint, ItemModel item) {
    Navigator.pop(context);
    if (myPoint > item.point) {
      _purchaseItem();
      WidgetFactory().toast(
        context,
        'icon/oval_success_fill',
        '상품 구매가 완료되었어요.\n구매내역에서 바로 확인해보세요',
        279,
        74,
      );
    } else {
      WidgetFactory().toast(context, 'icon/oval_exclamation_fill',
          '상품 구매를 위한 포인트가 부족해요', 278, 53);
    }
  }

  Future<void> _purchaseItem() async {
    {
      await HistoryDao.createItem(item.name, item.shopName, item.image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 28),
      width: double.infinity,
      child: FloatingActionButton.extended(
        backgroundColor: ColorItems.blueColor,
        onPressed: () {
          _showdialog(context, item);
        },
        label: Text(
          '구매하기',
          style: TextItems.textStyle
              .copyWith(fontSize: 16, color: ColorItems.white),
        ),
      ),
    );
  }

  Future<dynamic> _showdialog(BuildContext context, ItemModel item) {
    AlertDialog alert = AlertDialog(
      backgroundColor: ColorItems.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      content: SizedBox(
        width: 319,
        height: 404,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetFactory.customSizedBox(height: 6),
            Images.getImages(item.image, width: 80, height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Center(
                child: Text(
                  '${item.name}을(를) 구매하시겠어요?',
                  style: TextItems.boldStyle.copyWith(
                      fontSize: 20, color: ColorItems.blueColor, height: 1.8),
                ),
              ),
            ),
            dialogRow('보유', MyData.getUser().point),
            dialogRow('소모', item.point),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorItems.white,
                      fixedSize: const Size(123, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('취소',
                      style: TextItems.textStyle.copyWith(
                          fontSize: 16, color: ColorItems.extraColor)),
                ),
                WidgetFactory.customSizedBox(width: 17),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorItems.blueColor,
                        fixedSize: const Size(123, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      checkPoint(context, MyData.getUser().point, item);
                    },
                    child: Text(
                      '구매하기',
                      style: TextItems.textStyle
                          .copyWith(fontSize: 16, color: ColorItems.white),
                    )),
              ],
            ),
          ],
        ),
      ),
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget dialogRow(String text, int point) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: [
          Text(
            text,
            style: TextItems.textStyle
                .copyWith(color: ColorItems.extraColor, fontSize: 14),
          ),
          const Spacer(),
          Text('${CustomUtil.numToText(point)} P',
              style: TextItems.boldStyle.copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}
