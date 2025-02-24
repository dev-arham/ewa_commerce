import 'package:ewa_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ewa_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: TColors.primary.withValues(alpha: 0.8),
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              left: -250,
              child: CircularContainer(
                backgroundColor: TColors.light.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 100,
              left: -300,
              child: CircularContainer(
                backgroundColor: TColors.light.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
