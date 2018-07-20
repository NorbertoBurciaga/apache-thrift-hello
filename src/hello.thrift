namespace cpp Hello

service Hello {
  void ping(),
  string message(1:string message)
}
