import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

verticalItemShimmer() => Shimmer.fromColors(
      baseColor: Colors.black12,
      enabled: true,
      direction: ShimmerDirection.ltr,
      highlightColor: Colors.black38,
      child: SizedBox(
        height: Get.height / 3,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            width: Get.width / 2.5,
            height: Get.height / 4,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            margin: const EdgeInsets.only(left: 10.0, top: 20.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );

itemHorizontalShimmer() => Shimmer.fromColors(
      baseColor: Colors.black12,
      enabled: true,
      direction: ShimmerDirection.ltr,
      highlightColor: Colors.black38,
      child: SizedBox(
        height: Get.height / 3,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            width: Get.width / 1.5,
            margin: const EdgeInsets.only(left: 10.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width / 1.5,
                  height: Get.height / 6,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 20.0,
                    width: 120.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 20.0,
                    width: 150.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );

largeItemHorizontalShimmer({bool isVertical = false}) => Shimmer.fromColors(
      baseColor: Colors.black12,
      enabled: true,
      direction: ShimmerDirection.ltr,
      highlightColor: Colors.black38,
      child: SizedBox(
        height: isVertical ? Get.height : Get.height / 3,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            width: Get.width,
            height: Get.height / 4,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          itemCount: 5,
          scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        ),
      ),
    );

detailMovieShimmer() => Shimmer.fromColors(
      baseColor: Colors.black12,
      enabled: true,
      direction: ShimmerDirection.ltr,
      highlightColor: Colors.black38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: Get.height / 2, color: Colors.grey),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0), color: Colors.grey),
            width: 180.0,
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0), color: Colors.grey),
            width: 160.0,
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0), color: Colors.grey),
            width: 140.0,
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0), color: Colors.grey),
            width: 120.0,
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          ),
        ],
      ),
    );
