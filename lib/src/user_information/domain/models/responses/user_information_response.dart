import 'package:equatable/equatable.dart';

import '../classes/user_information.dart';

class UserInformationResponse extends Equatable {
  final String status;
  final UserInformation userInformation;

  UserInformationResponse({
    required this.status,
    required this.userInformation,
  });

  factory UserInformationResponse.fromMap(Map<String, dynamic> map) {
    return UserInformationResponse(
      status: (map['status'] ?? '') as String,
      userInformation: UserInformation.fromJson(map['data']),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, userInformation];
}
