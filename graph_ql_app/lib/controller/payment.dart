import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../main.dart';

class PaymentController extends GetxController {
  final PaymentIntentsStatus status = PaymentIntentsStatus.Unknown;
  final CardFieldInputDetails cardFieldInputDetails =
      CardFieldInputDetails(complete: false);
  final BillingDetails billingDetails = BillingDetails();
  Future<void> initPaymentSheet(String clientSecret) async {
    try {
      log('start');
      // 1. create payment intent on the server
      // final data = await createTestPaymentSheet();

      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            // Set to true for custom flow
            customFlow: false,
            // Main params
            merchantDisplayName: 'Flutter Stripe Store Demo',
            allowsDelayedPaymentMethods: true,
            style: ThemeMode.dark
            // paymentIntentClientSecret: data['paymentIntent'],
            // Customer keys
            // customerEphemeralKeySecret: data['ephemeralKey'],
            // customerId: data['customer'],
            // Extra options
            // testEnv: true,
            // applePay: true,
            // googlePay: true,
            // style: ThemeMode.dark,
            // merchantCountryCode: 'DE',
            ),
      );
      update();
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error: $e',
      ));
      rethrow;
    }
  }

  @override
  void onInit() {
    initPaymentSheet(stripSecretsKey);
    super.onInit();
  }
}
