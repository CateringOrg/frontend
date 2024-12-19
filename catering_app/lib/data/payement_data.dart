class PayementDTO {
  String orderId;
  String paymentMethod;
  String login;
  String password;

  PayementDTO({
    this.orderId = '',
    this.paymentMethod = '',
    this.login = '',
    this.password = '',
  });
}
