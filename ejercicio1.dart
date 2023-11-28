import 'dart:io';

void main() {

  List<List<int>> votos = List.generate(4, (_) => List.filled(5, 0));

  for (int zona = 0; zona < 4; zona++) {
    print('Introduce los votos para la Zona ${zona + 1}:');
    for (int candidato = 0; candidato < 5; candidato++) {
      print('Candidato ${candidato + 1}: ');
      int voto;
      do {
        voto = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        if (voto < 0) {
          print('Por favor, introduce un número válido de votos.');
        }
      } while (voto < 0);
      votos[zona][candidato] = voto;
    }
  }

  print('Tabla de votos:');
  print('Zona\tCandidato 1\tCandidato 2\tCandidato 3\tCandidato 4\tCandidato 5');
  for (int zona = 0; zona < 4; zona++) {
    String fila = '${zona + 1}\t';
    fila += votos[zona].join('\t\t');
    print(fila);
  }
}
