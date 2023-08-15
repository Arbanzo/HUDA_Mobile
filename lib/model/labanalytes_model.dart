class LabAnalytes {
  List<Analytes>? analytes; // list of lab OBJECTS; it is nullable!
  int? totalcount; // total count of labs; it is nullable!

  LabAnalytes({this.analytes, this.totalcount});

  LabAnalytes.fromJson(Map<String, dynamic> json) {
    if (json['analytes'] != null) {
      // check for labs in JSON!
      analytes = <Analytes>[]; // instantiate an empty list to store labs!
      json['analytes'].forEach((v) {
        // loop thru each lab in JSON!
        analytes!.add(Analytes.fromJson(v)); // add new lab object to list!
      });
    }
    totalcount = json['totalcount']; // get total count from JSON data!
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    if (analytes != null) {
      // null check!
      data['analytes'] = analytes!
          .map((v) => v.toJson())
          .toList(); // convert all lab objects to JSON then add to list in the map!
    }
    data['totalcount'] = totalcount; // add total count to map!
    return data;
  }
}

class Analytes {
  // all nullable variables from json response since some data is null!
  String? valuestatus;
  String? resultstatus;
  String? analytename;
  String? referencerange;
  String? analytedate;
  String? value;
  String? abnormalflag;
  String? note;
  int? analyteid;
  String? units;
  String? labresultstatus;

  Analytes(
      {this.valuestatus,
      this.resultstatus,
      this.analytename,
      this.referencerange,
      this.analytedate,
      this.value,
      this.abnormalflag,
      this.note,
      this.analyteid,
      this.units,
      this.labresultstatus});

  Analytes.fromJson(Map<String, dynamic> json) {
    // these all grab the associated value w the variable from the JSON!
    valuestatus = json['valuestatus'];
    resultstatus = json['resultstatus'];
    analytename = json['analytename'];
    referencerange = json['referencerange'];
    analytedate = json['analytedate'];
    value = json['value'];
    abnormalflag = json['abnormalflag'];
    note = json['note'];
    analyteid = json['analyteid'];
    units = json['units'];
    labresultstatus = json['labresultstatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    // these all add the value of the variable to the map above!
    data['valuestatus'] = valuestatus;
    data['resultstatus'] = resultstatus;
    data['analytename'] = analytename;
    data['referencerange'] = referencerange;
    data['analytedate'] = analytedate;
    data['value'] = value;
    data['abnormalflag'] = abnormalflag;
    data['note'] = note;
    data['analyteid'] = analyteid;
    data['units'] = units;
    data['labresultstatus'] = labresultstatus;
    return data;
  }
}
