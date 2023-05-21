import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/data/data.dart';
import 'package:ppstech/resources/text.dart';
import 'package:ppstech/screen/category_detail/detail.dart';
import '../../../resources/images.dart';

class GridCategoryWidget extends StatelessWidget {
  const GridCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 456,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          childAspectRatio: 1.1,
          children: MyData.getCategoryData()
              .map((e) => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryDetailScreen(
                                  category: e,
                                )),
                      );
                    },
                    child: Column(
                      children: [
                        Images.getImages(e.image, width: 40, height: 40),
                        WidgetFactory.customSizedBox(height: 15),
                        Text(e.title,
                            style: TextItems.textStyle
                                .copyWith(fontSize: 14, height: 1.6)),
                      ],
                    ),
                  ))
              .toList(),
        ));
  }
}
