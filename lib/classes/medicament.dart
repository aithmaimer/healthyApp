class Medicament {
  final String userId,
      nomMedicament,
      formPharmacetique,
      datDebut,
      dateFin,
      momentPrise,
      horairePrise;

  Medicament(
      {this.userId,
      this.nomMedicament,
      this.formPharmacetique,
      this.datDebut,
      this.dateFin,
      this.momentPrise,
      this.horairePrise});
  Map<String, dynamic> toMap() {
    return {
      "userId": this.userId,
      "nomMedicament": this.nomMedicament,
      "datDebut": this.datDebut,
      "dateFin": this.dateFin,
      "momentPrise": this.momentPrise,
      "horairePrise": this.horairePrise,
      "formPharmacetique,": this.formPharmacetique
    };
  }
}
