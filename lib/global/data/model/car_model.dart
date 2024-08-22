class CarModel {
  final int? id;
  final String marca;
  final String modelo;
  final double precio;
  final int ceroAcien;

  CarModel({
    this.id,
    required this.marca,
    required this.modelo,
    required this.precio,
    required this.ceroAcien,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      precio: json['precio'].toDouble(),
      ceroAcien: json['ceroAcien'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'precio': precio,
      'ceroAcien': ceroAcien,
    };
  }

  Map<String, dynamic> toJsonWithoutId() {
    final map = toJson();
    map.remove('id');
    return map;
  }


}
