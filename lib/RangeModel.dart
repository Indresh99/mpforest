class RangeModel{
  int sno;
  String range_EName;
  String range_HName;
  int std;
  int phoneNO;
  int mobileNO;
  String fax;
  String email;

  RangeModel(this.std, this.email, this.fax, this.mobileNO, this.phoneNO, this.sno, this.range_EName, this.range_HName);

  RangeModel.fromJson(Map<String, dynamic> json){
    sno= json['Sr.No'];
    range_EName= json['Range_EName'];
    range_HName= json['Range_HName'];
    std= json['STD'];
    mobileNO= json['MobileNO'];
    fax= json['FAXNo'];
    email= json['EMAIL'];
    phoneNO = json['PhoneNO'];

  }


}