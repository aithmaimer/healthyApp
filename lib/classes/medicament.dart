class Medicament {
  final String userId,
      nomMedicament,
      datDebut,
      duree,
      momentPrise,
      horairePrise;

  Medicament(
      {this.userId,
      this.nomMedicament,
      this.datDebut,
      this.duree,
      this.momentPrise,
      this.horairePrise});
  Map<String, dynamic> toMap() {
    return {
      "userId": this.userId,
      "nomMedicament": this.nomMedicament,
      "datDebut": this.datDebut,
      "duree": this.duree,
      "momentPrise": this.momentPrise,
      "horairePrise": this.horairePrise
    };
  }
}
