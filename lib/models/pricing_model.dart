class PricingModel {
  final String name;
  final double price;
  final List<String> included;
  final List<String> notIncluded;

  PricingModel(
      { this.name,
       this.price,
       this.included,
       this.notIncluded});
}
