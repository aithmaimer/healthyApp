class DocierMedi {
  final String nom,
      prenom,
      groupSanguin,
      adresse,
      poid,
      taille,
      mobile,
      dateN,
      userId;

  DocierMedi(
      {this.nom,
      this.prenom,
      this.dateN,
      this.groupSanguin,
      this.adresse,
      this.mobile,
      this.userId,
      this.poid,
      this.taille});

  Map<String, dynamic> toMap() {
    return {
      "nom": this.nom,
      "prenom": this.prenom,
      "mobile": this.mobile,
      "adresse": this.adresse,
      "date_naissance": this.dateN,
      "group_sanguin": this.groupSanguin,
      "poid": this.poid,
      "taille": this.taille,
      "userId": this.userId
    };
  }
}
