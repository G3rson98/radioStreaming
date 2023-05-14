class HttpResponse<T> {
  final String message;
  final bool ok;
  final T? data;

  HttpResponse({
    this.message = '',
    this.ok = false,
    this.data
  });


}