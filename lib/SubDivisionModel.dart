class SubDivisionModel{
  int sno;
  String subDiv_EName;
  String subDiv_HName;
  int std;
  String phoneNO;
  int mobileNO;
  String fax;
  String email;

  SubDivisionModel(this.std, this.email, this.fax, this.mobileNO, this.phoneNO, this.sno, this.subDiv_EName, this.subDiv_HName);

  SubDivisionModel.fromJson(Map<String, dynamic> json){
    sno= json['Sr.No'];
    subDiv_EName= json['SubDiv_EName'];
    subDiv_HName= json['SubDiv_HName'];
    std= json['STD'];
    mobileNO= json['MobileNO'];
    fax= json['FAXNo'];
    email= json['EMAIL'];
    phoneNO = json['PhoneNO'];

  }


}