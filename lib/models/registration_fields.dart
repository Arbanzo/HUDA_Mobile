//This page houses registration fields. In order to have the registration work properly, this pages initializes each field
//as a local value, which can then be called upon and submitted to the clinic.

// ignore: camel_case_types
class form1 {
  String? firstName;
  String? lastname;
  String? dob;
  String? sex;
  String? insurance;
  String? email;
  String? phone;
  String? callconsent;
  String? textconsent;
  String? maritalstatus;
  String? householdsize;
  String? employment;
  String? income;
  String? address;
  String? city;
  String? state;
  String? zipcode;
  String? contact1Fname;
  String? contact1Lname;
  String? contact1Relation;
  String? contact1Phone;
  String? contact2Fname;
  String? contact2Lname;
  String? contact2Relation;
  String? contact2Phone;
  String? contact3Fname;
  String? contact3Lname;
  String? contact3Relation;
  String? contact3Phone;
  String? sec1ans1;
  String? sec1ans2;
  String? sec1ans3;
  String? sec1ans4;
  String? sec1ans5;
  String? sec1ans6;
  String? sec1ans7;
  String? sec1ans8;
  String? sec1total;
  String? sec2ans1;
  String? sec2ans2;
  String? sec2ans3;
  String? sec2ans4;
  String? sec2ans5;
  String? sec2ans6;
  String? sec2ans7;
  String? sec2total;
  String? sec3ans1;
  String? sec3ans2;
  String? sec3ans3;
  String? sec3ans4;

  form1(
    this.firstName,
    this.lastname,
    this.dob,
    this.sex,
    this.insurance,
    this.email,
    this.phone,
    this.callconsent,
    this.textconsent,
    this.maritalstatus,
    this.householdsize,
    this.employment,
    this.income,
    this.address,
    this.city,
    this.state,
    this.zipcode,
    this.contact1Fname,
    this.contact1Lname,
    this.contact1Phone,
    this.contact1Relation,
    this.contact2Fname,
    this.contact2Lname,
    this.contact2Phone,
    this.contact2Relation,
    this.contact3Fname,
    this.contact3Lname,
    this.contact3Phone,
    this.contact3Relation,
    this.sec1ans1,
    this.sec1ans2,
    this.sec1ans3,
    this.sec1ans4,
    this.sec1ans5,
    this.sec1ans6,
    this.sec1ans7,
    this.sec1ans8,
    this.sec1total,
    this.sec2ans1,
    this.sec2ans2,
    this.sec2ans3,
    this.sec2ans4,
    this.sec2ans5,
    this.sec2ans6,
    this.sec2ans7,
    this.sec2total,
    this.sec3ans1,
    this.sec3ans2,
    this.sec3ans3,
    this.sec3ans4,
  );

//In an attempt to condense passing each individual value, this currently non-functional section was meant to make it all
//done in one line.
  Map<String?, dynamic> toJson() => {
        'firstName': firstName,
        'lastname': lastname,
        'dob': dob,
        'sex': sex,
        'insurance': insurance,
        'email': email,
        'phone': phone,
        'callconsent': callconsent,
        'textconsent': textconsent,
        'maritalstatus': maritalstatus,
        'householdsize': householdsize,
        'employment': employment,
        'income': income,
        'address': address,
        'city': city,
        'state': state,
        'zipcode': zipcode,
      };
}
