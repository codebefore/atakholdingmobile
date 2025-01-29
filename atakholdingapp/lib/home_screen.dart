import 'package:atakholdingapp/controllers/auth_controller.dart';
import 'package:atakholdingapp/controllers/home_controller.dart';
import 'package:atakholdingapp/models/user_model.dart';
import 'package:atakholdingapp/screens/offer_detail_screen.dart';
import 'package:atakholdingapp/utility/singleton.dart';
import 'package:atakholdingapp/widgets/home/empty_offers.dart';
import 'package:atakholdingapp/widgets/home/home_app_bar.dart';
import 'package:atakholdingapp/widgets/home/home_drawer.dart';
import 'package:atakholdingapp/widgets/home/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? token = "";
  UserModel user = UserModel();
  GetStorage storage = getIt.get<GetStorage>();
  final authController = Get.find<AuthController>();
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    token = storage.read("token");
    user = UserModel.fromJson(storage.read("user"));
    authController.setToken(token ?? "");
    authController.setUser(user);

    homeController.getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const HomeAppBar(),
      drawer: HomeDrawer(
        user: user,
        authController: authController,
      ),
      body: Obx(() {
        final offers = homeController.offerList;

        return RefreshIndicator(
          onRefresh: () async {
            await homeController.getOffers();
          },
          color: const Color(0xFF2563EB),
          child: offers.isEmpty
              ? SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: const Center(
                      child: EmptyOffers(),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: offers.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  itemBuilder: (context, index) {
                    final offer = offers[index];
                    return OfferCard(
                      offer: offer,
                      onTap: () {
                        Get.to(() => OfferDetailScreen(offer: offer));
                      },
                    );
                  },
                ),
        );
      }),
    );
  }
}

