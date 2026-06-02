import '../model/emission.dart';

class EmissionRepository {
  List<Emission> getAll() {
    return [
      Emission(
        local: 'São Paulo',
        source: 'Indústria',
        value: 125,
      ),
      Emission(
        local: 'Rio de Janeiro',
        source: 'Transporte',
        value: 85,
      ),
      Emission(
        local: 'Brasília',
        source: 'Energia',
        value: 65,
      ),
      Emission(
        local: 'Manaus',
        source: 'Desmatamento',
        value: 210,
      ),
    ];
  }
}