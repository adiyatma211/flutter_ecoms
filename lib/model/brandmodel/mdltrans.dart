class trans {
  int? userId;
  String? nama;
  String? title;
  int? quantity;
  int? total;
  String? alamat;
  String? pengiriman;
  String? updatedAt;
  String? createdAt;
  int? id;

  trans(
      {this.userId,
      this.nama,
      this.title,
      this.quantity,
      this.total,
      this.alamat,
      this.pengiriman,
      this.updatedAt,
      this.createdAt,
      this.id});

  trans.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    nama = json['nama'];
    title = json['title'];
    quantity = json['quantity'];
    total = json['total'];
    alamat = json['alamat'];
    pengiriman = json['pengiriman'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['nama'] = this.nama;
    data['title'] = this.title;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['alamat'] = this.alamat;
    data['pengiriman'] = this.pengiriman;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
