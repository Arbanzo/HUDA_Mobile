class AthenaOneJSON {
  int? totalcount; // total count of appts; it is nullable!
  List<Appointments>? appointments; // list of appt OBJECTS; it is nullable!

  AthenaOneJSON({this.totalcount, this.appointments});

  AthenaOneJSON.fromJson(Map<String, dynamic> json) {
    totalcount = json['totalcount']; // get total count from JSON data!
    if (json['appointments'] != null) {
      // check for appts in JSON!
      appointments =
          <Appointments>[]; // instantiate an empty list to store appts!
      json['appointments'].forEach((v) {
        // loop thru each appt in JSON!
        appointments!
            .add(Appointments.fromJson(v)); // add new appt object to list!
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    data['totalcount'] = totalcount; // add total count to map!
    if (appointments != null) {
      // null check!
      data['appointments'] = appointments!
          .map((v) => v.toJson())
          .toList(); // convert all appt objects to JSON then add to list in the map!
    }
    return data;
  }
}

class Appointments {
  // all nullable variables from json response since some data is null!
  String? date;
  int? copay;
  int? duration;
  String? appointmenttypeid;
  String? appointmentid;
  String? appointmenttype;
  String? starttime;
  String? patientappointmenttypename;
  String? departmentid;
  String? providerid;
  Appointmentcopay? appointmentcopay;
  String? appointmentstatus;

  Appointments(
      {this.date,
      this.copay,
      this.duration,
      this.appointmenttypeid,
      this.appointmentid,
      this.appointmenttype,
      this.starttime,
      this.patientappointmenttypename,
      this.departmentid,
      this.providerid,
      this.appointmentcopay,
      this.appointmentstatus});

  Appointments.fromJson(Map<String, dynamic> json) {
    // these all grab the associated value w the variable from the JSON!
    date = json['date'];
    copay = json['copay'];
    duration = json['duration'];
    appointmenttypeid = json['appointmenttypeid'];
    appointmentid = json['appointmentid'];
    appointmenttype = json['appointmenttype'];
    starttime = json['starttime'];
    patientappointmenttypename = json['patientappointmenttypename'];
    departmentid = json['departmentid'];
    providerid = json['providerid'];
    appointmentcopay = json['appointmentcopay'] != null
        ? Appointmentcopay.fromJson(json['appointmentcopay'])
        : null;
    appointmentstatus = json['appointmentstatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    // these all add the value of the variable to the map above!
    data['date'] = date;
    data['copay'] = copay;
    data['duration'] = duration;
    data['appointmenttypeid'] = appointmenttypeid;
    data['appointmentid'] = appointmentid;
    data['appointmenttype'] = appointmenttype;
    data['starttime'] = starttime;
    data['patientappointmenttypename'] = patientappointmenttypename;
    data['departmentid'] = departmentid;
    data['providerid'] = providerid;
    if (appointmentcopay != null) {
      data['appointmentcopay'] = appointmentcopay!.toJson();
    }
    data['appointmentstatus'] = appointmentstatus;
    return data;
  }
}

class Appointmentcopay {
  int? collectedforother;
  int? collectedforappointment;
  int? insurancecopay;

  Appointmentcopay(
      {this.collectedforother,
      this.collectedforappointment,
      this.insurancecopay});

  Appointmentcopay.fromJson(Map<String, dynamic> json) {
    collectedforother = json['collectedforother'];
    collectedforappointment = json['collectedforappointment'];
    insurancecopay = json['insurancecopay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectedforother'] = collectedforother;
    data['collectedforappointment'] = collectedforappointment;
    data['insurancecopay'] = insurancecopay;
    return data;
  }
}
