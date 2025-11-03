class LocationEntity {
  final String displayName;
  final String? city;
  final String? country;

  LocationEntity({
    required this.displayName,
    this.city,
    this.country,
  });
}