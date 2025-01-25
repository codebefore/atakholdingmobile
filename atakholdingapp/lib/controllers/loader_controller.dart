import 'package:atakholdingapp/utility/enums.dart';
import 'package:get/get.dart';

class LoaderController extends GetxController {
  //loading get set
  final _status = Status.initial.obs;
  Status get status => _status.value;
  void setStatus(Status b) {
    _status.value = b;
    update();
  }
}
