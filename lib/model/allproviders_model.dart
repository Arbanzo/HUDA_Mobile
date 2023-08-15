class AllProviders {
  List<Providers>? providers; // list of provider OBJECTS; it is nullable!
  int? totalcount; // total count of providers; it is nullable!

  AllProviders({this.providers, this.totalcount});

  AllProviders.fromJson(Map<String, dynamic> json) {
    if (json['providers'] != null) {
      // check for providers in JSON!
      providers =
          <Providers>[]; // instantiate an empty list to store the providers!
      json['providers'].forEach((v) {
        // loop thru each provider in JSON!
        providers!
            .add(Providers.fromJson(v)); // add new provider object to list!
      });
    }
    totalcount = json['totalcount']; // get total count from provider JSON data!
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    if (providers != null) {
      // null check!
      data['providers'] = providers!
          .map((v) => v.toJson())
          .toList(); // convert all providers objects to JSON then add to list in the map!
    }
    data['totalcount'] = totalcount; // add total count to map!
    return data;
  }
}

class Providers {
  // all nullable variables from json response since some data is null!
  String? firstname;
  bool? acceptingnewpatients;
  String? schedulingname;
  bool? billable;
  String? ansinamecode;
  String? lastname;
  int? providerid;
  String? ansispecialtycode;
  bool? hideinportal;
  String? sex;
  String? entitytype;
  bool? createencounteroncheckin;
  String? providertypeid;
  int? npi;
  String? providertype;
  String? specialty;
  String? homedepartment;
  String? displayname;
  String? providerusername;
  String? scheduleresourcetype;
  String? supervisingproviderusername;
  int? supervisingproviderid;

  Providers(
      {this.firstname,
      this.acceptingnewpatients,
      this.schedulingname,
      this.billable,
      this.ansinamecode,
      this.lastname,
      this.providerid,
      this.ansispecialtycode,
      this.hideinportal,
      this.sex,
      this.entitytype,
      this.createencounteroncheckin,
      this.providertypeid,
      this.npi,
      this.providertype,
      this.specialty,
      this.homedepartment,
      this.displayname,
      this.providerusername,
      this.scheduleresourcetype,
      this.supervisingproviderusername,
      this.supervisingproviderid});

  Providers.fromJson(Map<String, dynamic> json) {
    // these all grab the associated value w the variable from the JSON!
    firstname = json['firstname'];
    acceptingnewpatients = json['acceptingnewpatients'];
    schedulingname = json['schedulingname'];
    billable = json['billable'];
    ansinamecode = json['ansinamecode'];
    lastname = json['lastname'];
    providerid = json['providerid'];
    ansispecialtycode = json['ansispecialtycode'];
    hideinportal = json['hideinportal'];
    sex = json['sex'];
    entitytype = json['entitytype'];
    createencounteroncheckin = json['createencounteroncheckin'];
    providertypeid = json['providertypeid'];
    npi = json['npi'];
    providertype = json['providertype'];
    specialty = json['specialty'];
    homedepartment = json['homedepartment'];
    displayname = json['displayname'];
    providerusername = json['providerusername'];
    scheduleresourcetype = json['scheduleresourcetype'];
    supervisingproviderusername = json['supervisingproviderusername'];
    supervisingproviderid = json['supervisingproviderid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    // these all add the value of the variable to the map above!
    data['firstname'] = firstname;
    data['acceptingnewpatients'] = acceptingnewpatients;
    data['schedulingname'] = schedulingname;
    data['billable'] = billable;
    data['ansinamecode'] = ansinamecode;
    data['lastname'] = lastname;
    data['providerid'] = providerid;
    data['ansispecialtycode'] = ansispecialtycode;
    data['hideinportal'] = hideinportal;
    data['sex'] = sex;
    data['entitytype'] = entitytype;
    data['createencounteroncheckin'] = createencounteroncheckin;
    data['providertypeid'] = providertypeid;
    data['npi'] = npi;
    data['providertype'] = providertype;
    data['specialty'] = specialty;
    data['homedepartment'] = homedepartment;
    data['displayname'] = displayname;
    data['providerusername'] = providerusername;
    data['scheduleresourcetype'] = scheduleresourcetype;
    data['supervisingproviderusername'] = supervisingproviderusername;
    data['supervisingproviderid'] = supervisingproviderid;
    return data;
  }
}
