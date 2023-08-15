class ProblemList {
  String? notelastmodifieddatetime;
  String? notelastmodifiedby;
  String? lastmodifieddatetime;
  int? totalcount; // total count of problems; it is nullable!
  String? sectionnote;
  String? lastupdated;
  String? lastmodifiedby;
  List<Problems>? problems; // list of problems OBJECTS; it is nullable!

  ProblemList(
      {this.notelastmodifieddatetime,
      this.notelastmodifiedby,
      this.lastmodifieddatetime,
      this.totalcount,
      this.sectionnote,
      this.lastupdated,
      this.lastmodifiedby,
      this.problems});

  ProblemList.fromJson(Map<String, dynamic> json) {
    notelastmodifieddatetime = json['notelastmodifieddatetime'];
    notelastmodifiedby = json['notelastmodifiedby'];
    lastmodifieddatetime = json['lastmodifieddatetime'];
    totalcount = json['totalcount']; // get total count from JSON data!
    sectionnote = json['sectionnote'];
    lastupdated = json['lastupdated'];
    lastmodifiedby = json['lastmodifiedby'];
    if (json['problems'] != null) {
      // check for labs in JSON!
      problems = <Problems>[]; // instantiate an empty list to store probs!
      json['problems'].forEach((v) {
        // loop thru each prob in JSON!
        problems!.add(Problems.fromJson(v)); // add new prob object to list!
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    data['notelastmodifieddatetime'] = notelastmodifieddatetime;
    data['notelastmodifiedby'] = notelastmodifiedby;
    data['lastmodifieddatetime'] = lastmodifieddatetime;
    data['totalcount'] = totalcount; // add total count to map!
    data['sectionnote'] = sectionnote;
    data['lastupdated'] = lastupdated;
    data['lastmodifiedby'] = lastmodifiedby;
    if (problems != null) {
      // null check!
      data['problems'] = problems!
          .map((v) => v.toJson())
          .toList(); // convert all prob objects to JSON then add to list in the map!
    }
    return data;
  }
}

class Problems {
  // all nullable variables from json response since some data is null!
  String? lastmodifieddatetime;
  String? name;
  String? bestmatchicd10code;
  int? problemid;
  List<Events>? events;
  String? codeset;
  String? lastmodifiedby;
  String? code;
  String? mostrecentdiagnosisnote;

  Problems(
      {this.lastmodifieddatetime,
      this.name,
      this.bestmatchicd10code,
      this.problemid,
      this.events,
      this.codeset,
      this.lastmodifiedby,
      this.code,
      this.mostrecentdiagnosisnote});

  Problems.fromJson(Map<String, dynamic> json) {
    // these all grab the associated value w the variable from the JSON!
    lastmodifieddatetime = json['lastmodifieddatetime'];
    name = json['name'];
    bestmatchicd10code = json['bestmatchicd10code'];
    problemid = json['problemid'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    codeset = json['codeset'];
    lastmodifiedby = json['lastmodifiedby'];
    code = json['code'];
    mostrecentdiagnosisnote = json['mostrecentdiagnosisnote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // map to hold data for JSON!
    // these all add the value of the variable to the map above!
    data['lastmodifieddatetime'] = lastmodifieddatetime;
    data['name'] = name;
    data['bestmatchicd10code'] = bestmatchicd10code;
    data['problemid'] = problemid;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    data['codeset'] = codeset;
    data['lastmodifiedby'] = lastmodifiedby;
    data['code'] = code;
    data['mostrecentdiagnosisnote'] = mostrecentdiagnosisnote;
    return data;
  }
}

class Events {
  String? eventtype;
  String? startdate;
  String? createddate;
  String? onsetdate;
  String? createdby;
  String? laterality;
  String? status;
  String? note;
  List<Diagnoses>? diagnoses;
  String? encounterdate;

  Events(
      {this.eventtype,
      this.startdate,
      this.createddate,
      this.onsetdate,
      this.createdby,
      this.laterality,
      this.status,
      this.note,
      this.diagnoses,
      this.encounterdate});

  Events.fromJson(Map<String, dynamic> json) {
    eventtype = json['eventtype'];
    startdate = json['startdate'];
    createddate = json['createddate'];
    onsetdate = json['onsetdate'];
    createdby = json['createdby'];
    laterality = json['laterality'];
    status = json['status'];
    note = json['note'];
    if (json['diagnoses'] != null) {
      diagnoses = <Diagnoses>[];
      json['diagnoses'].forEach((v) {
        diagnoses!.add(Diagnoses.fromJson(v));
      });
    }
    encounterdate = json['encounterdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventtype'] = eventtype;
    data['startdate'] = startdate;
    data['createddate'] = createddate;
    data['onsetdate'] = onsetdate;
    data['createdby'] = createdby;
    data['laterality'] = laterality;
    data['status'] = status;
    data['note'] = note;
    if (diagnoses != null) {
      data['diagnoses'] = diagnoses!.map((v) => v.toJson()).toList();
    }
    data['encounterdate'] = encounterdate;
    return data;
  }
}

class Diagnoses {
  String? codeset;
  String? name;
  String? code;

  Diagnoses({this.codeset, this.name, this.code});

  Diagnoses.fromJson(Map<String, dynamic> json) {
    codeset = json['codeset'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codeset'] = codeset;
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}
