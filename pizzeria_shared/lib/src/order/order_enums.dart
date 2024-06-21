enum ProductType { pizza, drink, side, dessert }

enum CrustInfo {
  thin('Thin'),
  thick('Thick'),
  philadelphia('Philadelphia'),
  hotdog('Hotdog');

  const CrustInfo(this.value);

  final String value;
}

enum SizeInfo {
  small('S (25 cm)'),
  medium('M (30 cm)'),
  large('L (35 cm)'),
  xlarge('XL (40 cm)'),
  xxlarge('XXL (45 cm)');

  const SizeInfo(this.value);

  final String value;
}
