import 'package:atakholdingapp/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OfferDetailsSection extends StatelessWidget {
  final OfferModel offer;

  const OfferDetailsSection({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Teklif Detayları',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildDetailItem(
                icon: Icons.business,
                title: 'Müşteri',
                value: offer.customer ?? '-',
                iconColor: Colors.blue.shade700,
                bgColor: Colors.blue.shade50,
              ),
              _buildDetailItem(
                icon: Icons.tag,
                title: 'Müşteri Kodu',
                value: offer.customerCode ?? '-',
                iconColor: Colors.purple.shade700,
                bgColor: Colors.purple.shade50,
              ),
              _buildDetailItem(
                icon: Icons.description,
                title: 'Belge Tipi',
                value: offer.documentType ?? '-',
                iconColor: Colors.orange.shade700,
                bgColor: Colors.orange.shade50,
              ),
              _buildDetailItem(
                icon: Icons.place,
                title: 'Teslimat Yeri',
                value: offer.deliveryLocation ?? '-',
                iconColor: Colors.green.shade700,
                bgColor: Colors.green.shade50,
              ),
              _buildDetailItem(
                icon: Icons.payment,
                title: 'Ödeme Koşulları',
                value: offer.paymentTerms ?? '-',
                iconColor: Colors.red.shade700,
                bgColor: Colors.red.shade50,
              ),
              _buildDetailItem(
                icon: Icons.event,
                title: 'Geçerlilik',
                value: offer.validityDate != null
                    ? DateFormat('dd.MM.yyyy').format(offer.validityDate!)
                    : '-',
                iconColor: Colors.teal.shade700,
                bgColor: Colors.teal.shade50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 