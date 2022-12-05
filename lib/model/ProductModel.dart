class ProductModel {
  String categoryID;

  String description;

  String id;

  String photo;

  List<dynamic> photos;

  String price;
  dynamic? extras;
  String? extras_price;
  String? size;
  String name;

  String vendorID;

  int quantity;

  ProductModel(
      {this.categoryID = '',
      this.description = '',
      this.id = '',
      this.photo = '',
      this.photos = const [],
      this.price = '',
      this.name = '',
      this.quantity = 1,
      this.size = "",
      this.extras = const [],
      this.extras_price = "",
      this.vendorID = ''});

  factory ProductModel.fromJson(Map<String, dynamic> parsedJson) {
    dynamic extrasVal;
    if (parsedJson['extras'] == null) {
      extrasVal = List<String>.empty();
    } else {
      if (parsedJson['extras'] is String) {
        if (parsedJson['extras'] == '[]') {
          extrasVal = List<String>.empty();
        } else {
          String extraDecode = parsedJson['extras'].toString().replaceAll("[", "").replaceAll("]", "").replaceAll("\"", "");
          if (extraDecode.contains(",")) {
            extrasVal = extraDecode.split(",");
          } else {
            extrasVal = [extraDecode];
          }
        }
      }
      if (parsedJson['extras'] is List) {
        extrasVal = parsedJson['extras'].cast<String>();
      }
    }
    int quanVal = 0;
    if (parsedJson['quantity'] == null || parsedJson['quantity'] == double.nan || parsedJson['quantity'] == double.infinity) {
      quanVal = 0;
    } else {
      if (parsedJson['quantity'] is String) {
        quanVal = int.parse(parsedJson['quantity']);
      } else {
        quanVal = (parsedJson['quantity'] is double)
            ? (parsedJson["quantity"].isNaN ? 0 : (parsedJson['quantity'] as double).toInt())
            : parsedJson['quantity'];
      }
    }
    return ProductModel(
      categoryID: parsedJson['categoryID'] ?? '',
      description: parsedJson['description'] ?? '',
      id: parsedJson['id'] ?? '',
      photo: parsedJson['photo'] ?? '',
      photos: parsedJson['photos'] ?? [],
      price: parsedJson['price'] ?? '',
      quantity: quanVal,
      name: parsedJson['name'] ?? '',
      vendorID: parsedJson['vendorID'] ?? '',
      size: parsedJson['size'] != null ? parsedJson['size'].toString() : "",
      extras: extrasVal,
      extras_price: parsedJson["extras_price"] != null ? parsedJson["extras_price"] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryID': this.categoryID,
      'description': this.description,
      'id': this.id,
      'photo': this.photo,
      'photos': this.photos,
      'price': this.price,
      'name': this.name,
      'quantity': this.quantity,
      'vendorID': this.vendorID,
      'size': this.size,
      "extras": this.extras,
      "extras_price": this.extras_price
    };
  }
}
