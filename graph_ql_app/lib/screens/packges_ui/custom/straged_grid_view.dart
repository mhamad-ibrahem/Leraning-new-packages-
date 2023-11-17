import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewWidget extends StatelessWidget {
  StaggeredGridViewWidget({super.key});
  final List images = [
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
    "https://smazee.com/uploads/blog/How-much-does-a-basic-Flutter-App-development-cost.png",
    "https://www.cdnsol.com/blog/wp-content/uploads/2019/12/flutter940x788.png",
    "https://d2ms8rpfqc4h24.cloudfront.net/advantages_of_using_flutter_for_mobile_app_development_b0284bbd0e.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      //AlignedGridView  for the classic grid view
      //MasonryGridView for image on the right have 1.5 from left image size
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 4,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: Image.network(images[index]));
        },
      ),
    );
  }
}
