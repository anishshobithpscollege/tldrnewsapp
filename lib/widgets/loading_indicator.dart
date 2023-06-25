import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 12.0,
                color: Colors.white,
              ),
              const SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                height: 12.0,
                color: Colors.white,
              ),
              const SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                height: 12.0,
                color: Colors.white,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        );
      },
    );
  }
}
