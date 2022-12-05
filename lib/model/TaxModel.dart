class TaxModel {
  String? tax_lable;
  bool? tax_active, islog = true;
  int? tax_amount;
  String? tax_type;

  TaxModel({this.tax_lable, this.tax_active, this.tax_amount, this.tax_type});

  TaxModel.fromJson(Map<String, dynamic> json) {
    int taxVal = 0;
    if (json['tax_active'] != null && json['tax_active']) {
      if (json.containsKey('tax_amount') && json['tax_amount'] != null) {
        islog = true;
        if (json['tax_amount'] is int) {
          taxVal = json['tax_amount'];
        } else if (json['tax_amount'] is String) {
          taxVal = int.parse(json['tax_amount']);
        }
      }
      tax_lable = json['tax_lable'];
      tax_active = json['tax_active'];
      tax_amount = taxVal;
      tax_type = json['tax_type'];
    }

    if (json.containsKey("active") && json['active'] != null && json['active']) {
      islog = false;
      if (json.containsKey('tax') && json['tax'] != null) {
        if (json['tax'] is int) {
          taxVal = json['tax'];
        } else if (json['tax'] is String) {
          taxVal = int.parse(json['tax']);
        }
      }
      tax_lable = json['lable'];
      tax_active = json['active'];
      tax_amount = taxVal;
      tax_type = json['type'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.islog!) {
      data['tax_lable'] = this.tax_lable;
      data['tax_active'] = this.tax_active;
      data['tax_amount'] = this.tax_amount;
      data['tax_type'] = this.tax_type;
    } else {
      data['lable'] = this.tax_lable;
      data['active'] = this.tax_active;
      data['tax'] = this.tax_amount;
      data['type'] = this.tax_type;
    }
    return data;
  }
}
