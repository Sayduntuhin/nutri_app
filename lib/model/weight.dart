class Weight {

  double? weight;
  String selectedUnit;

  Weight({this.weight = 0.0, this.selectedUnit = "Kilogram"});

  copyWith({
    double? weight,
    String? selectedUnit,
  }) {
    return Weight(
      weight: weight ?? this.weight,
      selectedUnit: selectedUnit ?? this.selectedUnit,
    );
  }

  @override
  String toString() {
    return 'Weight{weight: $weight, selectedUnit: $selectedUnit}';
  }
}
