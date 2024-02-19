
class DlvDtl {
  String userId;
  String userName;
  String userEmail;
  String? userNumber;
  String? userAddress;
  DlvDtl ({
    required this.userId,
    required this.userName,
    required this.userEmail,
});
  factory DlvDtl.fromMap(Map<String,dynamic>map){
    return DlvDtl(userId: map["userId"], userName: map["userName"], userEmail: map["userEmail"]);
  }
  Map<String,dynamic>toMap(){
    return {
      "userId":userId,
      "userName":userName,
      "userEmail":userEmail,
      "userNumber":userNumber,
      "userAddress":userAddress,

    };

}

}