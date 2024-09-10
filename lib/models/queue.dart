class QueueModel {
  late int id, queueNumber, customerPax;
  late DateTime dateIn;
  late dynamic dateConfirm;
  late String customerName, customerPhone, storeName;
  late dynamic storeId;
  late bool currentCustomer;

  // Constructor
  QueueModel({
    required this.queueNumber,
    required this.customerPax,
    required this.customerName,
    required this.customerPhone,
    required this.storeName,
    required this.dateIn,
    this.dateConfirm,
    this.storeId,
    required this.id,
    required this.currentCustomer,
  });

  QueueModel.fromJson(Map<String, dynamic> json) {
    queueNumber = json['queueNumber'];
    customerPax = json['customerPax'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    storeName = json['storeName'];
    dateIn = json['dateIn'];
    dateConfirm = json['dateConfirm'];
    storeId = json['storeId'];
    id = json['id'];
    currentCustomer = json['currentCustomer'];
  }
}
