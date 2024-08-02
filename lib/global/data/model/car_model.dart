class CarModel {
  final int id;
  final String marca;
  final String modelo;
  final double precio;
  final int ceroACien;

  CarModel({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.precio,
    required this.ceroACien,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      precio: json['precio'].toDouble(),
      ceroACien: json['ceroACien'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'precio': precio,
      'ceroACien': ceroACien,
    };
  }
}
