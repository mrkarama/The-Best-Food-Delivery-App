import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController passwordController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController(
        authRepository: Get.find(), sharedPreferences: Get.find()));
    // print('REMOVE TOKEN....');
    // controller.removeToken();
    return GetBuilder<LoginController>(
      builder: (loginController) {
        return Scaffold(
          body: loginController.isLoading
              ? const CustomLoader()
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(
                          70.h,
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/logo part 1.png',
                            fit: BoxFit.fill,
                            width: 250.w,
                          ),
                        ),
                        verticalSpacer(
                          40.h,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 15.w,
                              right: 15.w,
                            ),
                            child: Text(
                              'hello'.tr,
                              style: robotoBlack.copyWith(
                                fontSize: 50.sp,
                              ),
                            )),
                        verticalSpacer(
                          10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                          ),
                          child: resizableText(
                            text: 'sign_into_your_account'.tr,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        verticalSpacer(
                          40.h,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 15.w,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  CustomSnackbar(
                                    'Feature upcoming',
                                    title: 'Coming soon',
                                    AppColors.mainColor,
                                  );
                                },
                                child: resizableText(
                                  text: 'forgot_password'.tr,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(
                          40.h,
                        ),
                        Center(
                          child: Container(
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
                                loginUser();
                              },
                              child: Center(
                                child: resizableText(
                                  text: 'sign_in'.tr,
                                  fontSize: 27.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        verticalSpacer(
                          30.h,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "don't have an account".tr,
                              style: GoogleFonts.roboto(
                                fontSize: 18.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                              children: [
                                TextSpan(
                                  text: 'create'.tr,
                                  style: GoogleFonts.roboto(
                                    fontSize: 19.sp,
                                    color: AppColors.mainBlackColor,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = (() {
                                      Get.offAndToNamed(
                                        AppRouteNames.getRegisterRoute(),
                                      );
                                    }),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Future<void> loginUser({
    bool isGoogle = false,
  }) async {
    if (!isGoogle) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();

      if (email.isEmpty) {
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
      } else {
        final SigninModel signinModel = SigninModel(
          email: email,
          password: password,
        );

        await Get.find<LoginController>().login(signinModel).then(
          (status) {
            if (status.isSuccess) {
              Get.find<WelcomeController>().setIsFromSplashScreen = false;
              print(
                  'Logintoken isssssssssssss ${sharedPreferences.getString(ApiValues.token)}');
              Get.offAllNamed(
                AppRouteNames.getWelcomeRoute(),
              );
            } else {
              CustomSnackbar(
                'invalid_email_or_password'.tr,
                Colors.redAccent,
                title: 'error'.tr,
              );
            }
          },
        );
      }
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
