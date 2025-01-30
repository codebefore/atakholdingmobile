import 'package:atakholdingapp/controllers/offer_detail_controller.dart';
import 'package:atakholdingapp/models/offer_model.dart';
import 'package:atakholdingapp/widgets/offer_detail/financial_summary_section.dart';
import 'package:atakholdingapp/widgets/offer_detail/offer_details_section.dart';
import 'package:atakholdingapp/widgets/offer_detail/offer_items_section.dart';
import 'package:atakholdingapp/widgets/offer_detail/offer_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferDetailScreen extends StatelessWidget {
  final OfferModel offer;

  OfferDetailScreen({Key? key, required this.offer}) : super(key: key);

  final offerDetailController = Get.find<OfferDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Get.back(),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(38),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            '#${offer.no}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FinancialSummarySection(offer: offer),
          OfferDetailsSection(offer: offer),
          OfferItemsSection(offer: offer),
        ],
      ),
      bottomNavigationBar: OfferActionBar(
        onApprove: () => offerDetailController.approveOffer(offer),
        onReject: (reason, explanation) => 
            offerDetailController.denyOffer(offer, reason, explanation),
      ),
    );
  }
}
