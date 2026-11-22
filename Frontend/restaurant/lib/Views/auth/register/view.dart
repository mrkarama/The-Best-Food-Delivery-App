import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController nameController;

  List<String> thirdPartyImages = [
    'f.png',
    'g.png',
    't.png',
  ];
  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (registerController) {
      return SafeArea(
        child: Scaffold(
          body: registerController.isLoading
              ? const CustomLoader()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpacer(
                        70.h,
                      ),
                      Image.asset(
                        'assets/images/logo part 1.png',
                        fit: BoxFit.fill,
                        width: 250.w,
                      ),
                      verticalSpacer(
                        25.h,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: 'email'.tr,
                        prefixIcon: Icon(
                          Icons.email,
                          size: 24.sp,
                          color: AppColors.mainColor,
                        ),
                      ),
                      verticalSpacer(
                        20.h,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        hintText: 'password'.tr,
                        isObscure: true,
                        prefixIcon: Icon(
                          Icons.password,
                          size: 24.sp,
                          color: AppColors.mainColor,
                        ),
                      ),
                      verticalSpacer(
                        20.h,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        hintText: 'phone'.tr,
                        prefixIcon: Icon(
                          Icons.phone_android,
                          size: 24.sp,
                          color: AppColors.mainColor,
                        ),
                      ),
                      verticalSpacer(
                        20.h,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        hintText: 'name'.tr,
                        prefixIcon: Icon(
                          Icons.person,
                          size: 24.sp,
                          color: Colors.grey,
                        ),
                      ),
                      verticalSpacer(
                        40.h,
                      ),
                      Container(
                        width: context.screenWidth * 0.4.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(
                            25.r,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            registerUser();
                          },
                          child: Center(
                            child: resizableText(
                              text: 'sign_up'.tr,
                              fontSize: 27.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      verticalSpacer(
                        30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAndToNamed(
                            AppRouteNames.getLoginRoute(),
                          );
                        },
                        child: Center(
                          child: resizableText(
                            text: 'have_an_account'.tr,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      // verticalSpacer(
                      //   30.h,
                      // ),
                      // Center(
                      //   child: Text(
                      //     'sign_up_using_one_of_the_following_methods'.tr,
                      //     maxLines: 2,
                      //     textAlign: TextAlign.center,
                      //     style: robotoRegular.copyWith(
                      //       fontSize: 17.sp,
                      //     ),
                      //   ),
                      // ),
                      // verticalSpacer(
                      //   5.h,
                      // ),
                      // Wrap(
                      //   children: List.generate(
                      //     3,
                      //     (index) {
                      //       return CircleAvatar(
                      //         radius: 33.r,
                      //         backgroundColor: Colors.white,
                      //         child: Image.asset(
                      //           'assets/images/${thirdPartyImages[index]}',
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
        ),
      );
    });
  }

  Future<void> registerUser() async {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String phone = phoneController.text.trim();

    if (name.isEmpty) {
      CustomSnackbar(
        'type_in_your_name'.tr,
        Colors.redAccent,
        title: 'name'.tr,
      );
    } else if (email.isEmpty) {
      CustomSnackbar(
        'type_in_your_email_address'.tr,
        Colors.redAccent,
        title: 'email_address'.tr,
      );
    } else if (!GetUtils.isEmail(email)) {
      CustomSnackbar(
        'type_in_a_correct_email_address'.tr,
        Colors.redAccent,
        title: 'invalid_email'.tr,
      );
    } else if (password.isEmpty) {
      CustomSnackbar(
        'type_in_your_password'.tr,
        Colors.redAccent,
        title: 'password'.tr,
      );
    } else if (password.length < 6) {
      CustomSnackbar(
        'password_must_have_at_least_6_characters'.tr,
        Colors.redAccent,
        title: 'invalid_password_length'.tr,
      );
    } else if (phone.isEmpty) {
      CustomSnackbar(
        'type_in_your_phone_number'.tr,
        Colors.redAccent,
        title: 'phone_number'.tr,
      );
    } else if (!GetUtils.isPhoneNumber(phone)) {
      CustomSnackbar(
        'type_in_a_correct_phone_number'.tr,
        Colors.redAccent,
        title: 'invalid_phone_number'.tr,
      );
    } else {
      final LoginModel loginModel = LoginModel(
        email: email,
        name: name,
        password: password,
        phone: phone,
      );

      await Get.find<RegisterController>()
          .registration(loginModel)
          .then((status) {
        if (status.isSuccess) {
          Get.find<WelcomeController>().setIsFromSplashScreen = false;
          Get.offAllNamed(
            AppRouteNames.getWelcomeRoute(),
          );
        } else {
          CustomSnackbar(
            status.message,
            Colors.redAccent,
            title: 'sign_up_error'.tr,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
