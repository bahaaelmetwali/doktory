import 'package:doktory/core/location/domain/entities/location_entity.dart';

class LocationResponseModel {
  final String? placeId;
  final String? licence;
  final String? osmType;
  final String? osmId;
  final double? lat;
  final double? lon;
  final String? displayName;
  final AddressModel? address;
  final List<String>? boundingBox;

  LocationResponseModel({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.displayName,
    this.address,
    this.boundingBox,
  });

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) {
    return LocationResponseModel(
      placeId: json['place_id']?.toString(),
      licence: json['licence'],
      osmType: json['osm_type'],
      osmId: json['osm_id']?.toString(),
      lat: double.tryParse(json['lat'] ?? ''),
      lon: double.tryParse(json['lon'] ?? ''),
      displayName: json['display_name'],
      address: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null,
      boundingBox: (json['boundingbox'] as List?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }
  LocationEntity toEntity() {
    return LocationEntity(
      displayName: displayName ?? '',
      city: address?.city,
      country: address?.country,
    );
  }
}

class AddressModel {
  final String? houseNumber;
  final String? road;
  final String? suburb;
  final String? city;
  final String? state;
  final String? country;
  final String? countryCode;

  AddressModel({
    this.houseNumber,
    this.road,
    this.suburb,
    this.city,
    this.state,
    this.country,
    this.countryCode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      houseNumber: json['house_number'],
      road: json['road'],
      suburb: json['suburb'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      countryCode: json['country_code'],
    );
  }
}
