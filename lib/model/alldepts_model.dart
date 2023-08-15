class AllDepts {
  int? totalcount; // total count of departments; it is nullable!
  List<Departments>? departments; // list of dept OBJECTS; it is nullable!

  AllDepts({this.totalcount, this.departments});

  AllDepts.fromJson(Map<String, dynamic> json) {
    totalcount = json['totalcount']; // get total count from JSON data!
    if (json['departments'] != null) {
      // check for departments in JSON!
      departments =
          <Departments>[]; // instantiate an empty list to store depts!
      json['departments'].forEach((v) {
        // loop thru each dept in JSON!
        departments!
            .add(Departments.fromJson(v)); // add new dept object to list!
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    data['totalcount'] = totalcount; // add total count to map!
    if (departments != null) {
      // null check!
      data['departments'] = departments!
          .map((v) => v.toJson())
          .toList(); // convert all dept objects to JSON then add to list in the map!
    }
    return data;
  }
}

class Departments {
  // all nullable variables from json response since some data is null!
  bool? medicationhistoryconsent;
  int? timezoneoffset;
  bool? ishospitaldepartment;
  String? providergroupid;
  String? state;
  String? portalurl;
  String? city;
  bool? placeofservicefacility;
  bool? servicedepartment;
  String? latitude;
  String? fax;
  String? providergroupname;
  bool? doesnotobservedst;
  String? departmentid;
  String? address;
  String? placeofservicetypeid;
  String? longitude;
  String? federaltaxid;
  String? clinicals;
  int? timezone;
  String? patientdepartmentname;
  String? chartsharinggroupid;
  String? name;
  String? placeofservicetypename;
  String? phone;
  String? zip;
  String? timezonename;

  Departments(
      {this.medicationhistoryconsent,
      this.timezoneoffset,
      this.ishospitaldepartment,
      this.providergroupid,
      this.state,
      this.portalurl,
      this.city,
      this.placeofservicefacility,
      this.servicedepartment,
      this.latitude,
      this.fax,
      this.providergroupname,
      this.doesnotobservedst,
      this.departmentid,
      this.address,
      this.placeofservicetypeid,
      this.longitude,
      this.federaltaxid,
      this.clinicals,
      this.timezone,
      this.patientdepartmentname,
      this.chartsharinggroupid,
      this.name,
      this.placeofservicetypename,
      this.phone,
      this.zip,
      this.timezonename});

  Departments.fromJson(Map<String, dynamic> json) {
    // these all grab the associated value w the variable from the JSON!
    medicationhistoryconsent = json['medicationhistoryconsent'];
    timezoneoffset = json['timezoneoffset'];
    ishospitaldepartment = json['ishospitaldepartment'];
    providergroupid = json['providergroupid'];
    state = json['state'];
    portalurl = json['portalurl'];
    city = json['city'];
    placeofservicefacility = json['placeofservicefacility'];
    servicedepartment = json['servicedepartment'];
    latitude = json['latitude'];
    fax = json['fax'];
    providergroupname = json['providergroupname'];
    doesnotobservedst = json['doesnotobservedst'];
    departmentid = json['departmentid'];
    address = json['address'];
    placeofservicetypeid = json['placeofservicetypeid'];
    longitude = json['longitude'];
    federaltaxid = json['federaltaxid'];
    clinicals = json['clinicals'];
    timezone = json['timezone'];
    patientdepartmentname = json['patientdepartmentname'];
    chartsharinggroupid = json['chartsharinggroupid'];
    name = json['name'];
    placeofservicetypename = json['placeofservicetypename'];
    phone = json['phone'];
    zip = json['zip'];
    timezonename = json['timezonename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    // these all add the value of the variable to the map above!
    data['medicationhistoryconsent'] = medicationhistoryconsent;
    data['timezoneoffset'] = timezoneoffset;
    data['ishospitaldepartment'] = ishospitaldepartment;
    data['providergroupid'] = providergroupid;
    data['state'] = state;
    data['portalurl'] = portalurl;
    data['city'] = city;
    data['placeofservicefacility'] = placeofservicefacility;
    data['servicedepartment'] = servicedepartment;
    data['latitude'] = latitude;
    data['fax'] = fax;
    data['providergroupname'] = providergroupname;
    data['doesnotobservedst'] = doesnotobservedst;
    data['departmentid'] = departmentid;
    data['address'] = address;
    data['placeofservicetypeid'] = placeofservicetypeid;
    data['longitude'] = longitude;
    data['federaltaxid'] = federaltaxid;
    data['clinicals'] = clinicals;
    data['timezone'] = timezone;
    data['patientdepartmentname'] = patientdepartmentname;
    data['chartsharinggroupid'] = chartsharinggroupid;
    data['name'] = name;
    data['placeofservicetypename'] = placeofservicetypename;
    data['phone'] = phone;
    data['zip'] = zip;
    data['timezonename'] = timezonename;
    return data;
  }
}
