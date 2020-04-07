import 'package:scoped_model/scoped_model.dart';

class HomeModel extends Model {
  bool _isEditMode = false;
  String _phoneNumber = '0000000000';

  get isEditMode => _isEditMode;

  get phoneNumber => _phoneNumber;

  void changeEditMode() {
    _isEditMode = !_isEditMode;
    notifyListeners();
  }

  void enterPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}
