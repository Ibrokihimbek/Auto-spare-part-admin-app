class UserModel {
  int age;
  String userId;
  String docId;
  String fullName;
  String email;
  String createdAt;
  String imageUrl;
  String fcmToken;

  UserModel({
    required this.age,
    required this.userId,
    required this.docId,
    required this.fullName,
    required this.email,
    required this.createdAt,
    required this.imageUrl,
    required this.fcmToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> josnData) {
    return UserModel(
      age: josnData['age'] as int? ?? 0,
      userId: josnData['userId'] as String? ?? '',
      fullName: josnData['fullName'] as String? ?? '',
      docId: josnData['docId'] as String? ?? '',
      email: josnData['email'] as String? ?? '',
      imageUrl: josnData['imageUrl'] as String? ?? '',
      createdAt: josnData['createdAt'] as String? ?? '',
      fcmToken: josnData['fcm_token'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'userId': userId,
      'fullName': fullName,
      'docId': docId,
      'email': email,
      'createdAt': createdAt,
      'imageUrl': imageUrl,
      'fcm_token': fcmToken,
    };
  }

  @override
  String toString() {
    return ''' 
      age : $age,
      userId : $userId,
      fullName : $fullName,
      email : $email,
      createdAt : $createdAt,
      imageUrl : $imageUrl,
      docId : $docId,
      fcmToken : $fcmToken,
      ''';
  }
}