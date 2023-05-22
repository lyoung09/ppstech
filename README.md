# ppstech

#### pubdev를 최소한으로 사용하기 위해, getx,bloc 패턴은 사용하지않았습니다.
#### Hexcolor, intl(숫자를 => #,000 형태로 바꾸기 위하여 사용), sqlite(구매 success 및 history 내역을 위해 사용),flutter toast 
#### common에서는 widgetfactory class를 이용하여, 자주 사용하는 위젯을 작성했습니다.(appbar,sizedbo,richtext,bottomdialog 및 toast 메세지 widget) (재사용을 간편하게 하기 위해 작성했습니다.)
#### dao에서는 history 내역을 저장하기 위하여, sql을 create, read를 작성했습니다.
#### data와 model에서는 과제의 카테고리,유저,판매사를 모델 클래스로 만들고, data에서 list 형태로 구현했습니다.
#### resources에서는 text theme, color 를 static으로 사용하였습니다.
#### screen에서는 화면 스크린과 widget으로 구분하여, 코드 분리 및 가독성을 신경 썼습니다
#### customutil에서는 intl 을 이용하여 int형태를 원하는(#000=>#,000)로 바꿨습니다.

##### dart fix --dry-run
##### dart fix --apply
##### flutter analyze를 사용하여 코드를 깔끔하게 정리했습니다.


#### 감사합니다 -이제영
