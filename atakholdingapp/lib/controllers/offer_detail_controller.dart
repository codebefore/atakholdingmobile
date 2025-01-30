import 'package:atakholdingapp/endpoints.dart';
import 'package:atakholdingapp/models/base_response_model.dart';
import 'package:atakholdingapp/models/offer_model.dart';
import 'package:atakholdingapp/utility/network_adaptor.dart';
import 'package:get/get.dart';

class OfferDetailController extends GetxController {
  Future<void> approveOffer(OfferModel offer) async {
    try {
      BaseResponseModel response = await NetworkAdaptor.get(
        Endpoints.approve,
        withToken: true,
        body: offer.toJson(),
      );

      if (response.success == true) {
        Get.back(result: true);
        Get.snackbar(
          'Başarılı',
          'Teklif başarıyla onaylandı',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Hata',
          response.message ?? 'Bir hata oluştu',
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

  Future<void> denyOffer(
      OfferModel offer, String reason, String? explanation) async {
    try {
      final updatedOffer = offer.copyWith(
        refuseReason: reason,
        refuseExplanation: explanation,
      );

      BaseResponseModel response = await NetworkAdaptor.get(
        Endpoints.deny,
        withToken: true,
        body: updatedOffer.toJson(),
      );

      if (response.success == true) {
        Get.back(result: true);
        Get.snackbar(
          'Başarılı',
          'Teklif başarıyla reddedildi',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Hata',
          response.message ?? 'Bir hata oluştu',
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
