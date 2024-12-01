enum ApiResultStatus { loading, success, error }

class ApiResult<T> {
  final ApiResultStatus status;
  final T? data;
  final String? errorMessage;

  ApiResult.loading()
      : status = ApiResultStatus.loading,
        data = null,
        errorMessage = null;

  ApiResult.success(this.data)
      : status = ApiResultStatus.success,
        errorMessage = null;

  ApiResult.error(this.errorMessage)
      : status = ApiResultStatus.error,
        data = null;
}
