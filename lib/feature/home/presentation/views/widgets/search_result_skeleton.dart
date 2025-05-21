import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultSkeleton extends StatelessWidget {
  const SearchResultSkeleton({super.key, this.itemCount = 7});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
          ),
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  // Image placeholder
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: width(context) * 0.2,
                      height: height(context) * 0.1,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Content placeholders
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title placeholder
                        Container(
                          width: double.infinity,
                          height: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        // First subtitle placeholder
                        Container(
                          width: width(context) * 0.3,
                          height: 12,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        // Second subtitle placeholder
                        Container(
                          width: width(context) * 0.25,
                          height: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
