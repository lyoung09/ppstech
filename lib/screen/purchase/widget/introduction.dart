import 'package:flutter/material.dart';
import 'package:ppstech/common/widget_factory.dart';
import 'package:ppstech/resources/colors.dart';
import 'package:ppstech/resources/text.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 407,
      width: 319,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('상품설명', style: TextItems.boldStyle.copyWith(fontSize: 14)),
          WidgetFactory.customSizedBox(height: 12),
          Text(
              '▶ 유의사항\n- 상기 이미지는 연출된 것으로 실제와 다를 수 있습니다.\n- 본 상품은 매장 재고 상황에 따라 동일 상품으로 교환이 불가능할 수 있습니다.- 동일 상품 교환이 불가한 경우 동일 가격 이상의 다른 상품으로 교환이 가능하며, 동일 상품 외 다른 상품으로 교환할 시 차액이 발생할 수 있습니다. (차액 추가 지불)\n- 스타벅스 앱의 사이렌 오더를 통해서도 주문 및 결제가 가능합니다. (일부 MD제외)\n- 미군부내 매장, 워터파크 입점 매장, 인천공항 입점 매장, 마장휴게소점 등 일부 매장에서는 사용이 불가합니다.\n- 해당 쿠폰과 스타벅스 카드의 복합결제 거래는 스타벅스 카드의 고유 혜택인 Free Extra 및 별 적립은 적용 대상이 아닌 점 이용에 참고하시기 바랍니다.\n- 정식 판매처 외의 장소나 경로를 통하여 구매하거나, 기타의 방법으로 보유하신 쿠폰은 정상적인 사용 (환불, 재전송 등 포함)이 금지되거나 제한될 수 있으니 주의하시기 바랍니다\n-  해당 쿠폰을 무단으로 가공하는 등의 행위는 관계 법령에 위반될 수 있습니다.',
              style: TextItems.textStyle.copyWith(
                  fontSize: 12, color: ColorItems.extraColor, height: 1.8))
        ],
      ),
    );
  }
}
