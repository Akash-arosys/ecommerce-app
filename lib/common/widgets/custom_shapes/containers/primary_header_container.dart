import 'package:real_estate/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:real_estate/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(backgroundColor: Color(0x1AFFFFFF)),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(backgroundColor: Color(0x1AFFFFFF)),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
