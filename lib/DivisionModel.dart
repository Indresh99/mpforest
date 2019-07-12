class DivisionModel{
  int sno;
  String div_EName;
  String div_HName;
  int std;
  int phoneNO;
  int mobileNO;
  String fax;
  String email;

  DivisionModel(this.std, this.email, this.fax, this.mobileNO, this.phoneNO, this.sno, this.div_EName, this.div_HName);

  DivisionModel.fromJson(Map<String, dynamic> json){
    sno= json['Sr.No'];
    div_EName= json['Div_EName'];
    div_HName= json['Div_HName'];
    std= json['STD'];
    mobileNO= json['MobileNO'];
    fax= json['FAXNO'];
    email= json['EMAIL'];
    phoneNO = json['PhoneNO'];

  }


}