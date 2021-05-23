class DocierMedi {
  final String username, email, poid, taille, groupSanguin, dateN, userId;

  DocierMedi(
      {this.username,
      this.email,
      this.dateN,
      this.groupSanguin,
      this.userId,
      this.poid,
      this.taille});

  Map<String, dynamic> toMap() {
    return {
      "username": this.username,
      "email": this.email,
      "date_naissance": this.dateN,
      "group_sanguin": this.groupSanguin,
      "poid": this.poid,
      "taille": this.taille,
      "userId": this.userId,
    };
  }
}
