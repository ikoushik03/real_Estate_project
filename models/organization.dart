// // @dart=2.9
// import 'package:realiq/config/response_keys.dart';
// import 'package:realiq/models/project.dart';
//
// class Organization {
//   final String id;
//   final String name;
//   final String businessEntity;
//   final String businessEntityType;
//   final String website;
//   final String type;
//   final String logoImageURL;
//   final Address address;
//   final String email;
//   final String phoneNumber;
//
//   Organization(
//       {this.id,
//         this.name,
//         this.businessEntity,
//         this.businessEntityType,
//         this.website,
//         this.type,
//         this.logoImageURL,
//         this.address,
//         this.email,
//         this.phoneNumber});
//
//   factory Organization.fromMap(Map<String, dynamic> map) {
//     final addressResponse = map[ResponseKeys.address];
//     return Organization(
//         id: map[ResponseKeys.id].toString(),
//         name: map[ResponseKeys.name] ?? '',
//         businessEntity: map[ResponseKeys.businessEntity] ?? '',
//         businessEntityType: map[ResponseKeys.businessEntityType] ?? '',
//         type: map[ResponseKeys.type] ?? '',
//         website: map[ResponseKeys.website] ?? '',
//         logoImageURL: map[ResponseKeys.logo] ?? '',
//         address: addressResponse == null
//             ? null
//             : addressResponse is Map
//             ? Address.fromMap(addressResponse)
//             : null,
//         email: map[ResponseKeys.email] ?? '',
//         phoneNumber: map[ResponseKeys.phone] ?? '');
//   }
// }
