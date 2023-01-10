class InfoModel {
  String infoId;
  String infoStore;
  String sellerName;
  String sellerPhoneNumber;

  InfoModel({
    required this.infoId,
    required this.infoStore,
    required this.sellerName,
    required this.sellerPhoneNumber,
  });

  factory InfoModel.formJson(Map<String, dynamic> jsonData) {
    return InfoModel(
      infoId: jsonData['infoId'] as String? ?? '',
      infoStore: jsonData['infoStore'] as String? ?? '',
      sellerName: jsonData['sellerName'] as String? ?? '',
      sellerPhoneNumber: jsonData['sellerPhoneNumber'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'infoId': infoId,
      'infoStore': infoStore,
      'sellerName': sellerName,
      'sellerPhoneNumber': sellerPhoneNumber,
    };
  }

  @override
  String toString() {
    return '''
      infoId: $infoId,
      infoStore: $infoStore,
      sellerName: $sellerName,
      sellerPhoneNumber: $sellerPhoneNumber,
 
      ''';
  }

  InfoModel copWith({
    String? infoId,
    String? infoStore,
    String? sellerName,
    String? sellerPhoneNumber,
  }) =>
      InfoModel(
        infoId: infoId ?? this.infoId,
        infoStore: infoStore ?? this.infoStore,
        sellerName: sellerName ?? this.sellerName,
        sellerPhoneNumber: sellerPhoneNumber ?? this.sellerPhoneNumber,
      );
}
