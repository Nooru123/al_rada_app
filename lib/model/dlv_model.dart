
class DlvDtl {
  String userId;
  String userName;
  String userEmail;
  String? userNumber;
  String ? imageUrl;
  DlvDtl ({
    required this.userId,
    required this.userName,
    required this.userEmail,
    this. userNumber,

    this.imageUrl,
});
  factory DlvDtl.fromMap(Map<String,dynamic>map){
    return DlvDtl(userId: map["userId"], userName: map["userName"],
      userEmail: map["userEmail"],
      userNumber: map["userNumber"],
      imageUrl: map['imageUrl'],);
  }
  Map<String,dynamic>toMap(){
    return {
      "userId":userId,
      "userName":userName,
      "userEmail":userEmail,
      "userNumber":userNumber,
      "imageUrl":imageUrl,

    };

}

}
class CtmDtl {
  String userId;
  String userName;
  String userEmail;
  String? userNumber;
  String? userAddress;
  String ? imageUrl;
  CtmDtl ({
    required this.userId,
    required this.userName,
    required this.userEmail,
    this.userNumber,
    this.userAddress,
    this.imageUrl,
});
  factory CtmDtl.fromMap(Map<String,dynamic>map){
    return CtmDtl(userId: map["userId"], userName: map["userName"],
      userEmail: map["userEmail"],
      userNumber: map["userNumber"],
      userAddress: map["userAddress"],
      imageUrl: map['imageUrl'],);
  }
  Map<String,dynamic>toMap(){
    return {
      "userId":userId,
      "userName":userName,
      "userEmail":userEmail,
      "userNumber":userNumber,
      "userAddress":userAddress,
      "imageUrl":imageUrl,

    };

}

}