class Coupon {
  String? sId;
  String? couponCode;
  String? discountType;
  double? discountAmount;
  double? minimumPurchaseAmount;
  String? endDate;
  String? status;
  String? applicableCategory;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Coupon({
    sId,
    couponCode,
    discountType,
    discountAmount,
    minimumPurchaseAmount,
    endDate,
    status,
    applicableCategory,
    applicableSubCategory,
    applicableProduct,
    createdAt,
    updatedAt,
    iV,
  });

  Coupon.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    couponCode = json['couponCode'];
    discountType = json['discountType'];
    discountAmount = json['discountAmount']?.toDouble();
    minimumPurchaseAmount = json['minimumPurchaseAmount']?.toDouble();
    endDate = json['endDate'];
    status = json['status'];
    applicableCategory = json['applicableCategory'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['couponCode'] = couponCode;
    data['discountType'] = discountType;
    data['discountAmount'] = discountAmount;
    data['minimumPurchaseAmount'] = minimumPurchaseAmount;
    data['endDate'] = endDate;
    data['status'] = status;
    data['applicableCategory'] = applicableCategory;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
