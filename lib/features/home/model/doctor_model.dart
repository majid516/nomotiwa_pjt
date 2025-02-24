class Doctor {
  String id;
  String name;
  String specialization;
  bool availability;
  List<Slot> slots;
  int v;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.availability,
    required this.slots,
    required this.v,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json["_id"],
      name: json["name"],
      specialization: json["specialization"],
      availability: json["availability"],
      slots: (json["slots"] as List).map((e) => Slot.fromJson(e)).toList(),
      v: json["__v"],
    );
  }

factory Doctor.fromAppointmentJson(Map<String, dynamic> json) {
  List<Slot> slots = [];
  if (json["patients"] != null && json["patients"] is List) {
    slots = (json["patients"] as List)
        .map((patient) => Slot(
              patientInfo: patient["patientInfo"] != null
                  ? PatientInfo.fromJson(patient["patientInfo"])
                  : PatientInfo(name: "", email: "", phone: ""),
              tokenNumber: patient["tokenNumber"] ?? 0,
              date: DateTime.tryParse(patient["date"] ?? "") ?? DateTime.now(),
              id: '', // Placeholder, as the appointment JSON doesn’t have a slot ID
            ))
        .toList();
  }

  return Doctor(
    id: json["doctorId"] ?? '',
    name: json["doctorName"] ?? '',
    specialization: json["specialization"] ?? '',
    availability: true, // Default value
    slots: slots,
    v: 0, // Default version
  );
}


  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "specialization": specialization,
      "availability": availability,
      "slots": slots.map((e) => e.toJson()).toList(),
      "__v": v,
    };
  }
}

class Slot {
  PatientInfo patientInfo;
  int tokenNumber;
  DateTime date;
  String id;

  Slot({
    required this.patientInfo,
    required this.tokenNumber,
    required this.date,
    required this.id,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      patientInfo: PatientInfo.fromJson(json["patientInfo"]),
      tokenNumber: json["tokenNumber"],
      date: DateTime.parse(json["date"]),
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "patientInfo": patientInfo.toJson(),
      "tokenNumber": tokenNumber,
      "date": date.toIso8601String(),
      "_id": id,
    };
  }
}

class PatientInfo {
  String name;
  String email;
  String phone;

  PatientInfo({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory PatientInfo.fromJson(Map<String, dynamic> json) {
    return PatientInfo(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}
