class AbuseModel {
  final String victimName;
  final String reporterName;
  final String reporterPhoneNumber;
  final String relationshipWithVictim;
  final String victimAddress;
  final String victimsAge;
  final String abuseType;
  final String description;

  AbuseModel({
    required this.victimName,
    required this.reporterName,
    required this.reporterPhoneNumber,
    required this.relationshipWithVictim,
    required this.victimAddress,
    required this.victimsAge,
    required this.abuseType,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      "victimName": victimName,
      "reporterName": reporterName,
      "reporterPhoneNumber": reporterPhoneNumber,
      "relationshipWithVictim": relationshipWithVictim,
      "victimAddress": victimAddress,
      "victimsAge": victimsAge,
      "abuseType": abuseType,
      "description": description,
    };
  }
}
