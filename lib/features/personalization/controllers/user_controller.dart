import 'package:e_comm_app/data/repositories/user_repository.dart';
import 'package:e_comm_app/features/authentication/models/usermodel.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
 
  //Initialization and variables.
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchuserRecord();
  }

//Fetch user record
  Future<void> fetchuserRecord() async {
    try {
      this.user(UserModel.empty());
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      throw 'Somthing went wrong!';
    }
    
  }
}
