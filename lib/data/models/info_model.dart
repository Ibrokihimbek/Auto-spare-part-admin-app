class InfoModel {
  String infoId;
  String infoStore;
  String sellerName;
  String sellerPhoneNumber;
  String address;

  InfoModel({
    required this.infoId,
    required this.infoStore,
    required this.sellerName,
    required this.sellerPhoneNumber,
    required this.address,
  });

  factory InfoModel.formJson(Map<String, dynamic> jsonData) {
    return InfoModel(
      address: jsonData['address'] as String? ?? '',
      infoId: jsonData['infoId'] as String? ?? '',
      infoStore: jsonData['infoStore'] as String? ?? '',
      sellerName: jsonData['sellerName'] as String? ?? '',
      sellerPhoneNumber: jsonData['sellerPhoneNumber'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'infoId': infoId,
      'infoStore': infoStore,
      'sellerName': sellerName,
      'sellerPhoneNumber': sellerPhoneNumber,
    };
  }

  @override
  String toString() {
    return '''
      address: $address,
      infoId: $infoId,
      infoStore: $infoStore,
      sellerName: $sellerName,
      sellerPhoneNumber: $sellerPhoneNumber,
 
      ''';
  }

  InfoModel copWith({
    String? address,
    String? infoId,
    String? infoStore,
    String? sellerName,
    String? sellerPhoneNumber,
  }) =>
      InfoModel(
        address: address ?? this.address,
        infoId: infoId ?? this.infoId,
        infoStore: infoStore ?? this.infoStore,
        sellerName: sellerName ?? this.sellerName,
        sellerPhoneNumber: sellerPhoneNumber ?? this.sellerPhoneNumber,
      );
}
