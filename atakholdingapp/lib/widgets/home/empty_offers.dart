import 'package:flutter/material.dart';

class EmptyOffers extends StatelessWidget {
  const EmptyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFFECF0F1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.inbox_outlined,
              size: 64,
              color: Color(0xFF7F8C8D),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Henüz teklif bulunmamaktadır',
            style: TextStyle(
              color: Color(0xFF2C3E50),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
