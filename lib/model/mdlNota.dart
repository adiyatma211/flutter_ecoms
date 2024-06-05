class getNota {
  String? message;
  List<Data>? data;

  getNota({this.message, this.data});

  getNota.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? nama;
  String? title;
  String? quantity;
  String? total;
  String? alamat;
  String? pengiriman;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.nama,
      this.title,
      this.quantity,
      this.total,
      this.alamat,
      this.pengiriman,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nama = json['nama'];
    title = json['title'];
    quantity = json['quantity'];
    total = json['total'];
    alamat = json['alamat'];
    pengiriman = json['pengiriman'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['nama'] = this.nama;
    data['title'] = this.title;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['alamat'] = this.alamat;
    data['pengiriman'] = this.pengiriman;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
