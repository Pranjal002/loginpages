import '../model/hive_constants.dart';

class HiveManager {
  HiveManager();

  final String _language = "language";
  final String _country = "country";
  final String _customerid = "customerid";

  void initLanguage() {
    if (!boxSetting.containsKey(_language)) {
      boxAddValue({_language: "en"}, boxSetting);
    }
  }

  String getLanguage() {
    return boxSetting.get(_language);
  }

  void updateLanguage(String languageCode) {
    return boxAddValue({_language: languageCode}, boxSetting);
  }

  bool checkLanguage() {
    return boxSetting.containsKey(_language);
  }

  bool checkCustomerID() {
    print(_customerid);
    print(boxSetting.containsKey(_customerid));
    return boxSetting.containsKey(_customerid);
  }

  String getCustomerID() {
    return boxSetting.get(_customerid);
  }

  void updateCustomerID(String customerID) {
    return boxAddValue({_customerid: customerID}, boxSetting);
  }

  void updateLockoutEndTime(lockoutEndTime) {
    boxAddValue({"lockoutEndTime": lockoutEndTime}, boxSetting);
  }

  DateTime? getLockoutEndTime() {
    final lockoutEndTime = boxSetting.get("lockoutEndTime");
    if (lockoutEndTime != null && lockoutEndTime is DateTime) {
      return lockoutEndTime;
    } else {
      return null;
    }
  }

  void removeLockoutEndTime() {
    boxDeleteValue(["lockoutEndTime"], boxSetting);
  }

  void updateUserID(language, country) {
    boxAddValue({_language: language, _country: country}, boxSetting);
  }

  void updateSignIn(customerid, language, country, numOfOrders, numOfMessages) {
    boxAddValue({
      _customerid: customerid,
      _language: language,
      _country: country,
      "numOfOrders": numOfOrders,
      "numOfMessages": numOfMessages,
    }, boxSetting);

    boxPrintContents(boxSetting);
  }
}
