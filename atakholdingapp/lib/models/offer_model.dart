import 'dart:convert';

class OfferModel {
  final double? cost;
  final String? creditGroup;
  final double? creditLimit;
  final String? currency;
  final int? currentOrder;
  final String? customer;
  final String? customerCode;
  final double? debt;
  final String? debtCurrency;
  final String? deliveryLocation;
  final String? department;
  final List<OfferDetailModel>? details;
  final String? distributionChannel;
  final double? documentLimit;
  final String? documentType;
  final String? documentTypeCode;
  final DateTime? incomingDate;
  final String? incomingTime;
  final String? limitCurrency;
  final String? no;
  final String? paymentTerms;
  final String? paymentTermsCode;
  final String? refuseExplanation;
  final String? refuseReason;
  final String? salesDistributionChannel;
  final String? salesGroup;
  final String? salesOrganization;
  final String? totalMeasureUnit;
  final String? userType;
  final String? userTypeCode;
  final DateTime? validityDate;

  OfferModel({
    this.cost,
    this.creditGroup,
    this.creditLimit,
    this.currency,
    this.currentOrder,
    this.customer,
    this.customerCode,
    this.debt,
    this.debtCurrency,
    this.deliveryLocation,
    this.department,
    this.details,
    this.distributionChannel,
    this.documentLimit,
    this.documentType,
    this.documentTypeCode,
    this.incomingDate,
    this.incomingTime,
    this.limitCurrency,
    this.no,
    this.paymentTerms,
    this.paymentTermsCode,
    this.refuseExplanation,
    this.refuseReason,
    this.salesDistributionChannel,
    this.salesGroup,
    this.salesOrganization,
    this.totalMeasureUnit,
    this.userType,
    this.userTypeCode,
    this.validityDate,
  });

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      cost: map['cost']?.toDouble(),
      creditGroup: map['creditGroup'],
      creditLimit: map['creditLimit']?.toDouble(),
      currency: map['currency'],
      currentOrder: map['currentOrder']?.toInt(),
      customer: map['customer'],
      customerCode: map['customerCode'],
      debt: map['debt']?.toDouble(),
      debtCurrency: map['debtCurrency'],
      deliveryLocation: map['deliveryLocation'],
      department: map['department'],
      details: map['details'] != null
          ? List<OfferDetailModel>.from(
              map['details']?.map((x) => OfferDetailModel.fromMap(x)))
          : null,
      distributionChannel: map['distributionChannel'],
      documentLimit: map['documentLimit']?.toDouble(),
      documentType: map['documentType'],
      documentTypeCode: map['documentTypeCode'],
      incomingDate: map['incomingDate'] != null
          ? DateTime.parse(map['incomingDate'])
          : null,
      incomingTime: map['incomingTime'],
      limitCurrency: map['limitCurrency'],
      no: map['no'],
      paymentTerms: map['paymentTerms'],
      paymentTermsCode: map['paymentTermsCode'],
      refuseExplanation: map['refuseExplanation'],
      refuseReason: map['refuseReason'],
      salesDistributionChannel: map['salesDistributionChannel'],
      salesGroup: map['salesGroup'],
      salesOrganization: map['salesOrganization'],
      totalMeasureUnit: map['totalMeasureUnit'],
      userType: map['userType'],
      userTypeCode: map['userTypeCode'],
      validityDate: map['validityDate'] != null
          ? DateTime.parse(map['validityDate'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cost': cost,
      'creditGroup': creditGroup,
      'creditLimit': creditLimit,
      'currency': currency,
      'currentOrder': currentOrder,
      'customer': customer,
      'customerCode': customerCode,
      'debt': debt,
      'debtCurrency': debtCurrency,
      'deliveryLocation': deliveryLocation,
      'department': department,
      'details': details?.map((x) => x.toMap()).toList(),
      'distributionChannel': distributionChannel,
      'documentLimit': documentLimit,
      'documentType': documentType,
      'documentTypeCode': documentTypeCode,
      'incomingDate': incomingDate?.toIso8601String(),
      'incomingTime': incomingTime,
      'limitCurrency': limitCurrency,
      'no': no,
      'paymentTerms': paymentTerms,
      'paymentTermsCode': paymentTermsCode,
      'refuseExplanation': refuseExplanation,
      'refuseReason': refuseReason,
      'salesDistributionChannel': salesDistributionChannel,
      'salesGroup': salesGroup,
      'salesOrganization': salesOrganization,
      'totalMeasureUnit': totalMeasureUnit,
      'userType': userType,
      'userTypeCode': userTypeCode,
      'validityDate': validityDate?.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());

  factory OfferModel.fromJson(String source) =>
      OfferModel.fromMap(json.decode(source));
}

class OfferDetailModel {
  final double? cost;
  final String? currency;
  final double? forwardingCost;
  final String? forwardingCurrency;
  final String? itemNo;
  final String? materialCode;
  final String? materialDesc;
  final double? maturityDifferenceCost;
  final String? maturityDifferenceCurrency;
  final String? measureUnit;
  final String? offerNo;
  final double? quantity;
  final double? unitPrice;

  OfferDetailModel({
    this.cost,
    this.currency,
    this.forwardingCost,
    this.forwardingCurrency,
    this.itemNo,
    this.materialCode,
    this.materialDesc,
    this.maturityDifferenceCost,
    this.maturityDifferenceCurrency,
    this.measureUnit,
    this.offerNo,
    this.quantity,
    this.unitPrice,
  });

  factory OfferDetailModel.fromMap(Map<String, dynamic> map) {
    return OfferDetailModel(
      cost: map['cost']?.toDouble(),
      currency: map['currency'],
      forwardingCost: map['forwardingCost']?.toDouble(),
      forwardingCurrency: map['forwardingCurrency'],
      itemNo: map['itemNo'],
      materialCode: map['materialCode'],
      materialDesc: map['materialDesc'],
      maturityDifferenceCost: map['maturityDifferenceCost']?.toDouble(),
      maturityDifferenceCurrency: map['maturityDifferenceCurrency'],
      measureUnit: map['measureUnit'],
      offerNo: map['offerNo'],
      quantity: map['quantity']?.toDouble(),
      unitPrice: map['unitPrice']?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cost': cost,
      'currency': currency,
      'forwardingCost': forwardingCost,
      'forwardingCurrency': forwardingCurrency,
      'itemNo': itemNo,
      'materialCode': materialCode,
      'materialDesc': materialDesc,
      'maturityDifferenceCost': maturityDifferenceCost,
      'maturityDifferenceCurrency': maturityDifferenceCurrency,
      'measureUnit': measureUnit,
      'offerNo': offerNo,
      'quantity': quantity,
      'unitPrice': unitPrice,
    };
  }

  String toJson() => json.encode(toMap());

  factory OfferDetailModel.fromJson(String source) =>
      OfferDetailModel.fromMap(json.decode(source));
} 