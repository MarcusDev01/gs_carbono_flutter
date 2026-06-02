import 'package:flutter/material.dart';
import '../../model/emission.dart';
import '../../repository/emission_repository.dart';
import '../../navigation/app_routes.dart';
import '../components/emission_card_list.dart';
import '../top_bar/climate_watch_top_bar.dart';

class EmissionsScreen extends StatelessWidget {
  const EmissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final repository = EmissionRepository();

    return Scaffold(
      appBar: const ClimateWatchTopBar(
        title: 'Lista de Emissões',
      ),
      body: EmissionCardList(
        emissions: repository.getAll(),
        onTap: (Emission emission) {
          Navigator.pushNamed(
            context,
            AppRoutes.emissionDetails,
            arguments: emission,
          );
        },
      ),
    );
  }
}