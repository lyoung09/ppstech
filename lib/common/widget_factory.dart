import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppstech/resources/colors.dart';
import 'package:ppstech/resources/images.dart';
import 'package:ppstech/resources/text.dart';
import '../screen/history/history.dart';

class WidgetFactory {
  static PreferredSizeWidget customAppBar(BuildContext context, String title,
      {String? action}) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(55.3),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: ColorItems.transParent,
          title: Text(title, style: TextItems.textStyle.copyWith(fontSize: 16)),
          centerTitle: true,
          leadingWidth: 50,
          leading: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    Images.getImages('icon/arrow_left', width: 8, height: 8)),
          ),
          actions: action != null
              ? [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoryScreen()),
                        );
                      },
                      child: Text(action,
                          style: TextItems.boldStyle.copyWith(
                              fontSize: 16, color: ColorItems.blueColor)))
                ]
              : null,
        ));
  }

  static Widget customSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static Widget customBetweenText(String text, String changeText,
      TextStyle textStyle, TextStyle forceStyle) {
    int start = text.indexOf(changeText);
    int end = start + changeText.length;
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: text.substring(0, start), style: textStyle),
      TextSpan(text: changeText, style: forceStyle),
      TextSpan(text: text.substring(end), style: textStyle)
    ]));
  }

  static Widget customBottomDialog(
      BuildContext context, double height, Widget widget) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: widget,
    );
  }

  void toast(context, String icon, String text, double width, double height) {
    final fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Images.getImages(
            icon,
          ),
          WidgetFactory.customSizedBox(width: 16),
          Text(text,
              style: TextItems.lightStyle.copyWith(
                  color: ColorItems.white, fontSize: 14, height: 1.8)),
        ],
      ),
    );

    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 1),
        positionedToastBuilder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 20,
                child: child,
              ),
            ],
          );
        });
  }
}
