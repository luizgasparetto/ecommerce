import 'package:ecommerce/core/exports/exports.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonProductCard extends StatelessWidget {
  const SkeletonProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: width * 0.4,
        height: height * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200,
        ),
      ),
    );
  }
}
