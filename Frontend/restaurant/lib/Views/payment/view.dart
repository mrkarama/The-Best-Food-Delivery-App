import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late String selectedUrl;

  final Completer<WebViewController> webviewController =
      Completer<WebViewController>();
  late WebViewController controllerGlobal;
  late dynamic data;
  late String orderId;
  late String userID;

  @override
  void initState() {
    super.initState();
    final PersonController personController = Get.find<PersonController>();
    userID = personController.userInfo.id.toString();
    data = Get.parameters;
    orderId = Get.find<PaymentController>().theOrderId; //data['order_id'];
    selectedUrl =
        '${ApiValues.appBaseUrl}/payment-mobile?customer_id=$userID&order_id=$orderId';
    // Test : http://10.180.3.8:8000/payment-mobile?customer_id=1&order_id=100007
    //selectedUrl="https://mvs.bslmeiyu.com";
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => exitApp(context),
      child: GetBuilder<PaymentController>(
        builder: (paymentController) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: MyOrderAppBar(
                text: 'payment'.tr,
                isBackButton: true,
              ),
              body: Center(
                child: SizedBox(
                  width: context.screenWidth,
                  child: Stack(
                    children: [
                      WebView(
                        initialUrl: selectedUrl,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (WebViewController controller) {
                          controllerGlobal = controller;
                        },
                        onProgress: (int progress) {
                          if (progress < 100) {
                            paymentController.setLoading = true;
                          } else {
                            paymentController.setLoading = false;
                          }
                        },
                        onPageFinished: (String url) {
                          paymentController.redirect(url);
                        },
                      ),
                      paymentController.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor)),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool> exitApp(BuildContext context) async {
    if (await controllerGlobal.canGoBack()) {
      controllerGlobal.goBack();
      return Future.value(false);
    } else {
      print("app exited");
      return true;
      // return Get.dialog(PaymentFailedDialog(orderID: widget.orderModel.id.toString()));
    }
  }
}
// Personal Payment Account Test
//sb-yky47i28028844@personal.example.com
//123@paypal