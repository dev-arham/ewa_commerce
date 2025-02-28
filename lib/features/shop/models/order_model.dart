import 'package:ewa_store/features/shop/models/coupon_model.dart';

class OrderModel {
  ShippingAddress? shippingAddress;
  OrderTotal? orderTotal;
  String? sId;
  UserID? userID;
  String? orderStatus;
  List<Items>? items;
  int? totalPrice;
  String? paymentMethod;
  Coupon? couponCode;
  String? orderDate;
  String? trackingUrl;
  int? iV;

  OrderModel({
    this.shippingAddress,
    this.orderTotal,
    this.sId,
    this.userID,
    this.orderStatus,
    this.items,
    this.totalPrice,
    this.paymentMethod,
    this.couponCode,
    this.orderDate,
    this.trackingUrl,
    this.iV,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    shippingAddress =
        json['shippingAddress'] != null
            ? ShippingAddress.fromJson(json['shippingAddress'])
            : null;
    orderTotal =
        json['orderTotal'] != null
            ? OrderTotal.fromJson(json['orderTotal'])
            : null;
    sId = json['_id'];
    userID = json['userID'] != null ? UserID.fromJson(json['userID']) : null;
    orderStatus = json['orderStatus'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    paymentMethod = json['paymentMethod'];
    couponCode =
        json['couponCode'] != null ? Coupon.fromJson(json['couponCode']) : null;
    orderDate = json['orderDate'];
    trackingUrl = json['trackingUrl'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shippingAddress != null) {
      data['shippingAddress'] = shippingAddress!.toJson();
    }
    if (orderTotal != null) {
      data['orderTotal'] = orderTotal!.toJson();
    }
    data['_id'] = sId;
    if (userID != null) {
      data['userID'] = userID!.toJson();
    }
    data['orderStatus'] = orderStatus;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = totalPrice;
    data['paymentMethod'] = paymentMethod;
    data['couponCode'] = couponCode!.toJson();
    data['orderDate'] = orderDate;
    data['trackingUrl'] = trackingUrl;
    data['__v'] = iV;
    return data;
  }
}

class ShippingAddress {
  String? phone;
  String? street;
  String? city;
  String? state;
  String? country;

  ShippingAddress({
    this.phone,
    this.street,
    this.city,
    this.state,
    this.country,
  });

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    return data;
  }
}

class OrderTotal {
  int? subTotal;
  int? discount;
  int? total;

  OrderTotal({this.discount, this.total, this.subTotal});

  OrderTotal.fromJson(Map<String, dynamic> json) {
    subTotal = json['subtotal'];
    discount = json['discount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['discount'] = discount;
    data['total'] = total;
    data['subtotal'] = subTotal;
    return data;
  }
}

class UserID {
  String? sId;
  String? firstName;
  String? lastName;

  UserID({this.sId, this.firstName, this.lastName});

  UserID.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}

class Items {
  String? productID;
  String? productName;
  int? quantity;
  int? price;
  String? sId;

  Items({
    this.productID,
    this.productName,
    this.quantity,
    this.price,
    this.sId,
  });

  Items.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    productName = json['productName'];
    quantity = json['quantity'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productID'] = productID;
    data['productName'] = productName;
    data['quantity'] = quantity;
    data['price'] = price;
    data['_id'] = sId;
    return data;
  }
}
