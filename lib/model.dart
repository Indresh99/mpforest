class Posts{
  String sno;
  String conservancy;
  String mobile;
  String phone;
  String email;
  String fax;

  Posts(this.email, this.conservancy, this.fax, this.mobile, this.phone, this.sno);

  Posts.fromJson(Map<String, dynamic> json){
      sno= json['Sr no'];
      conservancy= json['Conservancy'];
      mobile= json['Ccf mobile '];
      email= json['Email'];
      phone= json['Phone '];
      fax= json['Fax'];

  }


}