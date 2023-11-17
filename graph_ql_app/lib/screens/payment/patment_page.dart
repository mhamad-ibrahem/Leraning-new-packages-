import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/controller/payment.dart';
import 'package:graph_ql_app/screens/payment/widget/configure.dart';
import 'package:pay/pay.dart';

import '../../main.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});
  final PaymentController controller = Get.put(PaymentController());
  final paymentItems = [
    PaymentItem(
      label: 'shoes',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    ),
    PaymentItem(
      label: 't-shirt',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    ),
    PaymentItem(
      label: 'Total',
      amount: '199.98',
      status: PaymentItemStatus.final_price,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PaymentController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Add card",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CardFormField(
                countryCode: '',
                onCardChanged: (details) {
                  log("${details?.number}");
                },
                autofocus: true,
                style: CardFormStyle(
                  borderRadius: 12,
                  borderColor: Colors.black,
                  borderWidth: 2,
                  fontSize: 13,
                  backgroundColor: Colors.grey.shade200,
                  placeholderColor: Colors.black,
                  cursorColor: Colors.black,
                  textColor: Colors.black,
                ),
                controller: CardFormEditController(
                    initialDetails: controller.cardFieldInputDetails),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                await Stripe.instance.initPaymentSheet(
                  paymentSheetParameters: SetupPaymentSheetParameters(
                      style: ThemeMode.dark,
                      merchantDisplayName: 'DK',
                      primaryButtonLabel: 'Payment',
                      setupIntentClientSecret: stripSecretsKey,
                      customerId: 'pi_1Gt0Dk2eZvKYlo2CPe4OxqjT',
                      allowsDelayedPaymentMethods: true),
                );
                await Stripe.instance.presentPaymentSheet();
              },
              child: Text(
                "Pay",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              color: Colors.black,
            ),
            ApplePayButton(
              paymentConfiguration:
                  PaymentConfiguration.fromJsonString(defaultApplePay),
              paymentItems: paymentItems,
              // style: ApplePayButtonStyle.black,
              // type: ApplePayButtonType.buy,

              margin: const EdgeInsets.only(top: 15.0),
              onPaymentResult: onApplePayResult,
              loadingIndicator: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            GooglePayButton(
              paymentConfiguration:
                  PaymentConfiguration.fromJsonString(defaultGooglePay),
              paymentItems: paymentItems,
              type: GooglePayButtonType.pay,
              margin: const EdgeInsets.only(top: 15.0),
              onPaymentResult: onGooglePayResult,
              loadingIndicator: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void onApplePayResult(paymentResult) {
  // Send the resulting Apple Pay token to your server / PSP
}

void onGooglePayResult(paymentResult) {
  // Send the resulting Google Pay token to your server / PSP
}
