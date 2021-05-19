class Contacts {
  final String specialite, mobile, name, ville, adresse, userId;

  Contacts(
      {this.specialite,
      this.mobile,
      this.name,
      this.ville,
      this.adresse,
      this.userId});
  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "specialite": this.specialite,
      "mobile": this.mobile,
      "ville": this.ville,
      "adresse": this.adresse,
      "userId": this.userId
    };
  }
}
