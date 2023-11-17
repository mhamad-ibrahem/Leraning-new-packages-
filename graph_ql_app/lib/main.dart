import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/screens/ad_mobs/ad_mobs_screen.dart';
import 'package:graph_ql_app/screens/agora/start_page.dart';
import 'package:graph_ql_app/screens/apis/api_screen.dart';
import 'package:graph_ql_app/screens/home/home_page_view.dart';
import 'package:graph_ql_app/screens/packges_ui/packages_ui.dart';
import 'package:graph_ql_app/screens/system/system_screens.dart';
import 'package:graph_ql_app/screens/widgets_pages/widget_learning.dart';
import 'package:graph_ql_app/screens/widgets_pages/widgets/auto_complete_widget.dart';
import 'package:graph_ql_app/services/app_services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/payment/patment_page.dart';

late Box box;
void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripPublishKey;
  Stripe.merchantIdentifier = 'DK';
  await Stripe.instance.applySettings();
  await initialServices();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PackagesUi(),
    );
  }
}

String stripPublishKey =
    "pk_test_51Nj39xEyrYmRV10k6zcSXrtMhLHwTlRiXMGNGtRUcnitywelUHykPNxp4MHFyJtOBvlKYCFAvzJ0Cw1KZM0E1iBh00WqQ6PI4r";
String stripSecretsKey =
    "sk_test_51Nj39xEyrYmRV10kT1uYQKHs4lck0XmOPJQGbVIAhL7cl11Sa3xdcjlNnEs3uCSGj8nnieLA9naFSKEqsivef5A000YxhKuzh0";
