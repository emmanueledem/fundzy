// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tranfers_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _TransfersApiClient implements TransfersApiClient {
  _TransfersApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://bank.veegil.com';
  }
  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<dynamic>> transfer(
      {required phoneNumber, required amount}) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = {'phoneNumber': phoneNumber, 'amount': amount};
    final result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(
                method: 'POST',
                headers: headers,
                extra: extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/accounts/transfer',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = result.data;
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
