import 'package:equatable/equatable.dart';

import '../classes/opinion.dart';

class RandomOpinionsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Opinion> opinions;

  RandomOpinionsResponse({
    required this.status,
    required this.totalResults,
    required this.opinions,
  });

  factory RandomOpinionsResponse.fromMap(Map<String, dynamic> map) {
    return RandomOpinionsResponse(
      status: (map['status'] ?? '') as String,
      totalResults: (map['totalResults'] ?? 0) as int,
      opinions: List<Opinion>.from(
        // Change this later
        // map['opinions'].map<Opinion>(
        map['articles'].map<Opinion>(
          (x) => Opinion.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, totalResults, opinions];
}
