import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';

import '../../../../core/widgets/my_cached_network_image.dart';

class BannerListWithIndicator extends StatefulWidget {
  const BannerListWithIndicator({super.key});

  @override
  BannerListWithIndicatorState createState() => BannerListWithIndicatorState();
}

class BannerListWithIndicatorState extends State<BannerListWithIndicator> {
  late final ValueNotifier<int> _currentIndex;

  late final CarouselSliderController _carouselController;

  final List<String> images = [
    'https://img.freepik.com/free-vector/flat-furniture-sale-landing-page-with-photo_23-2148926583.jpg?ga=GA1.1.1888007192.1743253587&semt=ais_hybrid',
    'https://img.freepik.com/premium-vector/furniture-banner-promotion-social-media-cover-design-modern-minimalist-template_602747-162.jpg?ga=GA1.1.1888007192.1743253587&semt=ais_hybrid',
    'https://img.freepik.com/free-vector/organic-flat-furniture-sale-banner-with-photo_23-2148931229.jpg?ga=GA1.1.1888007192.1743253587&semt=ais_hybrid',
    'https://img.freepik.com/premium-psd/website-shoppers-showing-woman-with-tablet-bag_1130490-123.jpg?ga=GA1.1.1888007192.1743253587&semt=ais_hybrid',
    'https://img.freepik.com/free-vector/flat-design-horizontal-banner-template_23-2149719802.jpg?ga=GA1.1.1888007192.1743253587&semt=ais_hybrid',
    'https://img.freepik.com/free-vector/flat-horizontal-banner-template-black-friday-sale_23-2150852978.jpg?ga=GA1.1.1888007192.1743253587&semt=ais_hybrid',
  ];

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselSliderController();
    _currentIndex = ValueNotifier<int>(0);
  }

  @override
  dispose() {
    _currentIndex.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: [
          CarouselSlider.builder(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 20.hR,
              enlargeFactor: 0.6,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              },
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) =>
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: MyCachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: images[index],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Custom interactive indicator using ValueListenableBuilder
          ValueListenableBuilder<int>(
            valueListenable: _currentIndex,
            builder: (context, current, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return InkWell(
                    onTap: () {
                      _carouselController.animateToPage(index);
                    },
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      width: 12.sp,
                      height: 12.sp,
                      margin: const EdgeInsets.all(4.0),
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: current == index
                            ? AppColors.primary
                            : AppColors.grey,
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
