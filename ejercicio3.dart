import 'dart:io';

class Asesoria {
  String usuario;
  String tipo;
  int sesiones;
  double costo;

  Asesoria(this.usuario, this.tipo, this.sesiones, this.costo);

  double get costoTotal => sesiones * costo;
}

double obtenerCostoPorTipo(int opcion) {
  switch (opcion) {
    case 1:
      return 80000; // Financiera
    case 2:
      return 75000; // Contable
    case 3:
      return 50000; // Comercial
    case 4:
      return 100000; // Inversión
    default:
      return 0;
  }
}

String obtenerNombreAsesoria(int opcion) {
  switch (opcion) {
    case 1:
      return 'Financiera';
    case 2:
      return 'Contable';
    case 3:
      return 'Comercial';
    case 4:
      return 'Inversión';
    default:
      return 'Desconocida';
  }
}

void main() {
  List<Asesoria> facturas = [];
  bool continuar = true;

  while (continuar) {
    stdout.write('Introduzca el nombre del usuario: ');
    String usuario = stdin.readLineSync()!;

    stdout.write('Seleccione el tipo de asesoría:\n1. Financiera\n2. Contable\n3. Comercial\n4. Inversión\nIngrese el número: ');
    int opcion = int.parse(stdin.readLineSync()!);

    stdout.write('Introduzca el número de sesiones: ');
    int sesiones = int.parse(stdin.readLineSync()!);

    double costo = obtenerCostoPorTipo(opcion);
    String tipoAsesoria = obtenerNombreAsesoria(opcion);
    Asesoria asesoria = Asesoria(usuario, tipoAsesoria, sesiones, costo);
    facturas.add(asesoria);

    stdout.write('¿Desea ingresar otra factura? (S/N): ');
    String respuesta = stdin.readLineSync()!.toUpperCase();
    if (respuesta != 'S') {
      continuar = false;
    }
  }

  imprimirFacturas(facturas);
  imprimirEstadisticas(facturas);
}

void imprimirFacturas(List<Asesoria> facturas) {
  print('No.\tUsuario\tAsesoría\tSesiones\tCosto total');
  for (var i = 0; i < facturas.length; i++) {
    print('${i + 1}\t${facturas[i].usuario}\t${facturas[i].tipo}\t${facturas[i].sesiones}\t${facturas[i].costoTotal}');
  }
}

void imprimirEstadisticas(List<Asesoria> facturas) {
  double totalCosto = facturas.fold(0, (sum, item) => sum + item.costoTotal);
  double promedioCosto = totalCosto / facturas.length;
  Asesoria mayorCosto = facturas.reduce((curr, next) => curr.costoTotal > next.costoTotal ? curr : next);
  Asesoria menorCosto = facturas.reduce((curr, next) => curr.costoTotal < next.costoTotal ? curr : next);

  print('Estadísticas de costo sesiones');
  print('Número de usuarios procesados: ${facturas.length}');
  print('Usuario con mayor costo total: ${mayorCosto.usuario} con ${mayorCosto.costoTotal}');
  print('Usuario con menor costo total: ${menorCosto.usuario} con ${menorCosto.costoTotal}');
  print('Sumatoria del costo total: $totalCosto');
  print('Promedio del costo total: $promedioCosto');
}
