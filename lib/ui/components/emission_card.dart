import 'package:flutter/material.dart';
import '../../model/emission.dart';

class EmissionCard extends StatelessWidget {
  final Emission emission;
  final VoidCallback onTap;

  const EmissionCard({
    super.key,
    required this.emission,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(emission.local),
        subtitle: Text(emission.source),
        trailing: Text('${emission.value} tCO₂'),
        onTap: onTap,
      ),
    );
  }
}