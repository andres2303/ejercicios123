import 'dart:io';

class Articulo {
  String codigo;
  String nombre;
  int stock;
  double costo;
  double precio;
  int ventas;

  Articulo(this.codigo, this.nombre, this.stock, this.costo, this.precio, this.ventas);

  double get saldo => stock - ventas.toDouble();
  double get valorVenta => ventas * precio;

  @override
  String toString() {
    return '$codigo\t$nombre\t$stock\t$costo\t$precio\t$ventas\t$saldo\t$valorVenta';
  }
}

void main() {
  List<Articulo> inventario = [];
  bool continuar = true;

  while (continuar) {
    stdout.write('Introduzca el código del artículo: ');
    String codigo = stdin.readLineSync()!;
    stdout.write('Introduzca el nombre del artículo: ');
    String nombre = stdin.readLineSync()!;
    stdout.write('Introduzca el stock del artículo: ');
    int stock = int.parse(stdin.readLineSync()!);
    stdout.write('Introduzca el costo del artículo: ');
    double costo = double.parse(stdin.readLineSync()!);
    stdout.write('Introduzca el precio del artículo: ');
    double precio = double.parse(stdin.readLineSync()!);
    stdout.write('Introduzca las ventas del artículo: ');
    int ventas = int.parse(stdin.readLineSync()!);

    Articulo articulo = Articulo(codigo, nombre, stock, costo, precio, ventas);
    inventario.add(articulo);

    stdout.write('¿Desea ingresar otro artículo? (S/N): ');
    String respuesta = stdin.readLineSync()!.toUpperCase();
    if (respuesta != 'S') {
      continuar = false;
    }
  }

  imprimirInventario(inventario);
  imprimirEstadisticas(inventario);
}

void imprimirInventario(List<Articulo> inventario) {
  print('Código\tNombre\tStock\tCosto\tPrecio\tVentas\tSaldo\tValor Venta');
  for (Articulo articulo in inventario) {
    print(articulo);
  }
}

void imprimirEstadisticas(List<Articulo> inventario) {
  double totalValorVenta = inventario.fold(0, (sum, item) => sum + item.valorVenta);
  double promedioValorVenta = totalValorVenta / inventario.length;
  int totalStock = inventario.fold(0, (sum, item) => sum + item.stock);
  int promedioStock = totalStock ~/ inventario.length;

  print('Sumas\t$totalStock\t...\t...\t$totalValorVenta');
  print('Promedio\t$promedioStock\t...\t...\t$promedioValorVenta');
}
