import 'package:ppstech/model/cateogory.dart';
import 'package:ppstech/model/item.dart';
import 'package:ppstech/model/shop.dart';
import 'package:ppstech/model/user.dart';

class MyData {
  static User getUser() {
    return User(5000, 1234, []);
  }

  static List<CategoryModel> getCategoryData() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(1, 'category/poultry_leg', '치킨/피자'));
    categories.add(CategoryModel(2, 'category/convenience_store', '편의점'));
    categories.add(CategoryModel(3, 'category/ice_coffee', '커피/음료'));
    categories.add(CategoryModel(4, 'category/hamburger', '버거'));
    categories.add(CategoryModel(5, 'category/doughnut', '베이커리'));
    categories.add(CategoryModel(6, 'category/icecream', '아이스크림'));
    categories.add(CategoryModel(7, 'category/fork_knife_with_plate', '외식'));
    categories.add(CategoryModel(8, 'category/popcorn', '영화/도서'));
    categories.add(CategoryModel(9, 'category/mobile_phone', '통신사'));
    categories.add(CategoryModel(10, 'category/admission_tickets', '상품권'));
    categories.add(CategoryModel(11, 'category/haircut', '헤어/뷰티'));
    categories.add(CategoryModel(12, 'category/airplane', '여행'));

    return categories;
  }

  static List<ItemModel> getItemData() {
    List<ItemModel> items = [];

    items.add(ItemModel(3, 'image/starbucks', '카페 아메리카노 T', '스타벅스', 3370,
        salePercent: 50, shopIndex: 101, price: 10340));
    items.add(ItemModel(
        3, 'image/twosome_americano', '아메리카노 (R)', '투썸플레이스', 3960,
        shopIndex: 107));
    items.add(ItemModel(
        3, 'image/ediya_americano', '(L)HOT아메리카노', '이디야커피', 1000,
        shopIndex: 103));
    items.add(ItemModel(
        3, 'image/ediya_coupon', '이디야 5,000원 금액권 ', '이디야커피', 4400,
        shopIndex: 103));
    items.add(ItemModel(
        6, 'image/starbucks', '베스킨라빈스 교환권[5,000원 금액권]', '베스킨라빈스', 2060));
    items.add(
        ItemModel(1, 'image/domino_bulgogi', '리얼불고기(치즈버스...', '도미노피자', 20680));
    items.add(
        ItemModel(1, 'image/bhc_chicken', '뿌링클+케이준프라이+뿌링소..', 'BHC', 30000));
    items.add(ItemModel(
        10, 'image/naverpay', '네이버페이 포인트 1,000원', '네이버페이 포인트쿠폰', 762));
    items.add(ItemModel(2, 'image/ramen', '농심)신라면(봉지)', 'GS25', 723));
    items.add(ItemModel(
        3, 'image/backdabang_americano', '앗메리카노(ICED)', '빽다방', 1446,
        shopIndex: 100));

    return items;
  }

  static List<ShopModel> getShopData() {
    List<ShopModel> shops = [];

    shops.add(ShopModel(100, 3, 'logo/backdabang_logo', '빽다방'));
    shops.add(ShopModel(101, 3, 'logo/starbucks_logo', '스타벅스'));
    shops.add(ShopModel(102, 3, 'logo/angelinus_logo', '엔제리너스'));
    shops.add(ShopModel(103, 3, 'logo/ediya_logo', '이디야커피'));
    shops.add(ShopModel(104, 3, 'logo/jambajuice_logo', '잠바주스'));
    shops.add(ShopModel(105, 3, 'logo/coffee_bean_logo', '커피빈'));
    shops.add(ShopModel(106, 3, 'logo/tomntoms_logo', '탐앤탐스'));
    shops.add(ShopModel(107, 3, 'logo/twosomeplace_logo', '투썸플레이스'));
    shops.add(ShopModel(108, 3, 'logo/pascucci_logo', '파스쿠찌'));
    shops.add(ShopModel(109, 3, 'logo/paulbassett_logo', '폴바셋'));

    return shops;
  }
}
