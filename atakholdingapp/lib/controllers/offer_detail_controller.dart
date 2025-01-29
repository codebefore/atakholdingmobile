import 'package:atakholdingapp/models/base_response_model.dart';
import 'package:atakholdingapp/models/offer_model.dart';
import 'package:atakholdingapp/utility/network_adaptor.dart';
import 'package:get/get.dart';

class OfferDetailController extends GetxController {
  Future<void> approveOffer(OfferModel offer) async {
    try {
      final response = await NetworkAdaptor.get(
        '/approve',
        withToken: true,
        body: offer.toJson(),
      );

      final baseResponse = BaseResponseModel.fromMap(response.data);

      if (baseResponse.success == true) {
        Get.back(result: true);
        Get.snackbar(
          'Başarılı',
          'Teklif başarıyla onaylandı',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Hata',
          baseResponse.message ?? 'Bir hata oluştu',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Hata',
        'Teklif onaylanırken bir hata oluştu',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> denyOffer(OfferModel offer) async {
    try {
      final response = await NetworkAdaptor.get(
        '/deny',
        withToken: true,
        body: offer.toJson(),
      );

      final baseResponse = BaseResponseModel.fromMap(response.data);

      if (baseResponse.success == true) {
        Get.back(result: true);
        Get.snackbar(
          'Başarılı',
          'Teklif başarıyla reddedildi',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Hata',
          baseResponse.message ?? 'Bir hata oluştu',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Hata',
        'Teklif reddedilirken bir hata oluştu',
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
