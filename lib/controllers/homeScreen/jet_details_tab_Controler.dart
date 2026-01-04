import 'package:get/get.dart';

class TabBarController extends GetxController{
  final RxInt _selectedIndex=0.obs;
  int get selectedIndex=>_selectedIndex.value;
  final List<Map<String,String>> tabsData =[

    {
      'title':"Overview",
      'content':'The Gulfstream G650 represents the pinnacle of business aviation. With its spacious cabin, advanced technology, and exceptional performance'
    },
    {
'title': 'Features',
      'content':
          'High-speed internet, ultra-long range, customisable interiors . With its spacious cabin, advanced technology, and exceptional performance '
    },
    {
'title': 'Specs',
      'content':
          'The Gulfstream G650 represents the pinnacle of business aviation. With its spacious cabin, advanced technology, and exceptional performance'
    }
  ];
  void changeTab(int index){
    _selectedIndex.value=index;
  }
  String get currentTabContent => tabsData[selectedIndex]['content']!;
}