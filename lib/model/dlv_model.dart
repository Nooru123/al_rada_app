
class DlvDtl {
  String userId;
  String userName;
  String userEmail;
  String? userNumber;
  String? userAddress;
  String ?imageUrl;
  DlvDtl ({
    required this.userId,
    required this.userName,
    required this.userEmail,
    this.imageUrl,
});
  factory DlvDtl.fromMap(Map<String,dynamic>map){
    return DlvDtl(userId: map["userId"], userName: map["userName"], userEmail: map["userEmail"],imageUrl: map['imageUrl'],);
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