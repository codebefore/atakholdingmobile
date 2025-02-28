import 'dart:developer';

import 'package:atakholdingapp/endpoints.dart';
import 'package:atakholdingapp/models/base_response_model.dart';
import 'package:atakholdingapp/models/offer_model.dart';
import 'package:atakholdingapp/utility/network_adaptor.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // offerList
  final RxList<OfferModel> _offerList = <OfferModel>[].obs;
  List<OfferModel> get offerList => _offerList;
  void setOfferList(List<OfferModel> offers) {
    _offerList.value = offers;
    update(offers);
  }

  // Offer list
  Future<bool> getOffers() async {
    try {
      BaseResponseModel response =
          await NetworkAdaptor.get(Endpoints.offers, withToken: true);
      if (response.success == true && response.data != null) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> offersList = responseData['offers'];

        final List<OfferModel> offers = offersList
            .map((item) => OfferModel.fromMap(item as Map<String, dynamic>))
            .toList();

        log('Parsed offers length: ${offers.length}');
        setOfferList(offers);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
