import 'package:flutter/material.dart';
import '../../model/emission.dart';
import 'emission_card.dart';

class EmissionCardList extends StatelessWidget {
  final List<Emission> emissions;
  final Function(Emission) onTap;

  const EmissionCardList({
    super.key,
    required this.emissions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: emissions.length,
      itemBuilder: (context, index) {
        final emission = emissions[index];

        return EmissionCard(
          emission: emission,
          onTap: () => onTap(emission),
        );
      },
    );
  }
}