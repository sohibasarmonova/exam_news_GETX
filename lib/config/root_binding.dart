import 'package:exam_news_getx/controller/home_controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController(),fenix: true);

  }
}