class BaseResponse<T> {
  final T? data;

  BaseResponse({this.data});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return BaseResponse(
      data: json['employees'] != null ? fromJsonT(json['employees']) : null,
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {
      'employees': data != null ? toJsonT(data as T) : null,
    };
  }
}