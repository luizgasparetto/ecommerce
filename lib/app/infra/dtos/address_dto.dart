// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ecommerce/app/domain/entities/address_entity.dart';

class AddressDTO extends AddressEntity {
  final String cep;
  final String street;
  final String complement;
  final String neighborhood;
  final String city;
  final String state;

  AddressDTO(
      {required this.cep,
      required this.street,
      required this.complement,
      required this.neighborhood,
      required this.city,
      required this.state})
      : super(
          cep: cep,
          street: street,
          complement: complement,
          neighborhood: neighborhood,
          city: city,
          state: state,
        );

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'street': street,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
    };
  }

  factory AddressDTO.fromMap(Map<String, dynamic> map) {
    return AddressDTO(
      cep: map['cep'] ?? '',
      street: map['street'] ?? '',
      complement: map['complement'] ?? '',
      neighborhood: map['neighborhood'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
    );
  }
}
