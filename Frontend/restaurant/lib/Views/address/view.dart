import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late TextEditingController contactPersonName;
  late TextEditingController contactPersonNumber;
  late TextEditingController address;
  @override
  void initState() {
    super.initState();

    Get.find<LocationController>().getAddressDataFromDatabase();
    contactPersonName = TextEditingController();
    contactPersonNumber = TextEditingController();

    address = TextEditingController();
    late bool isLoggedIn;

    isLoggedIn = Get.find<PersonController>().isUserLogged();

    if (isLoggedIn) {
      Get.find<PersonController>().getUserInformation();
      Get.find<LocationController>().getAddressDataFromDatabase();
      contactPersonName.text =
          Get.find<PersonController>().userInfo.name.toString();
      contactPersonNumber.text =
          Get.find<PersonController>().userInfo.phone.toString();
    }

    if (Get.find<LocationController>().addressList.isNotEmpty) {
      // Get getUserAddress()
      address.text = Get.find<LocationController>().addressList[0].address;
      // Get also use position
    } else if (Get.find<LocationController>().isUserAddressSaved()) {
      address.text = Get.find<LocationController>().getAddressData().address;
    } else if (Get.find<LocationController>().userAddressFromBD.isNotEmpty) {
      address.text =
          Get.find<LocationController>().userAddressFromBD.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LocationController>(
        builder: (locationController) {
          // print('REMOVE ADDRESS SHARED');
          // locationController.removeSharedAddressData();
          return RefreshIndicator(
            backgroundColor: AppColors.backgroundColor,
            color: AppColors.mainColor,
            onRefresh: locationController.getAddressDataFromDatabase,
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: MyOrderAppBar(
                text: 'add_address'.tr,
                isBackButton: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: context.screenHeight * 0.25.h,
                        margin: EdgeInsets.only(
                          left: context.screenWidth / 41.143,
                          right: 10.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            7.r,
                          ),
                          border: Border.all(
                            width: 3.0.w,
                            color: AppColors.mainColor,
                          ),
                        ),
                        child: Stack(
                          children: [
                            GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: locationController.initialPoition,
                                zoom: 17,
                              ),
                              zoomControlsEnabled: false,
                              compassEnabled: false,
                              indoorViewEnabled: false,
                              myLocationEnabled: true,
                              onCameraIdle: () {
                                locationController.updatePosition(
                                    locationController.cameraPosition, true);
                              },
                              onCameraMove: (position) {
                                locationController.cameraPosition = position;
                              },
                              onMapCreated:
                                  (GoogleMapController mapController) {
                                locationController
                                    .setMapController(mapController);
                              },
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(
                        30.h,
                      ),
                      Wrap(
                        children: List.generate(
                            locationController.addressTypeList.length, (index) {
                          final String name =
                              locationController.addressTypeList[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              right: 25.w,
                              left: 10.w,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                locationController.setAddressTypeIndex(index);
                              },
                              child: Container(
                                width: 70.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    5.r,
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xffe2e2e2),
                                      spreadRadius: 3.r,
                                      blurRadius: 12.r,
                                      // offset: Offset(
                                      //   1.w,
                                      //   5.h,
                                      // ),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    name == 'office'
                                        ? Icons.work
                                        : (name == 'home'
                                            ? Icons.home
                                            : Icons.location_on),
                                    color:
                                        locationController.addressTypeIndex ==
                                                index
                                            ? AppColors.mainColor
                                            : Theme.of(context).disabledColor,
                                    size: 30.sp,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      verticalSpacer(
                        20.h,
                      ),
                      ColumnTextFieldAndName(
                        title: 'delivery_address'.tr,
                        isDisabled: true,
                        textEditingController: address,
                        prefixIcon: Icon(
                          Icons.location_on,
                          size: 24.sp,
                          color: AppColors.yellowColor,
                        ),
                        keyboardType: TextInputType.streetAddress,
                      ),
                      verticalSpacer(
                        25.h,
                      ),
                      ColumnTextFieldAndName(
                        title: 'contact_person_name'.tr,
                        textEditingController: contactPersonName,
                        isDisabled: false,
                        prefixIcon: Icon(
                          Icons.person,
                          size: 24.sp,
                          color: AppColors.yellowColor,
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      verticalSpacer(
                        25.h,
                      ),
                      ColumnTextFieldAndName(
                        title: 'contact_person_number'.tr,
                        textEditingController: contactPersonNumber,
                        isDisabled: false,
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 24.sp,
                          color: AppColors.yellowColor,
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      verticalSpacer(
                        45.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 30.h,
                          left: context.screenWidth * 0.28.w,
                          right: context.screenWidth * 0.28.w,
                        ),
                        width: 300, //AppValues.screenWidth * 0.4.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(
                            15.r,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (address.text.isEmpty) {
                              CustomSnackbar(
                                'Type in your delivery address',
                                AppColors.mainColor,
                                title: 'Address',
                              );
                            } else {
                              if (locationController.isUserAddressSaved() &&
                                  (locationController.userAddressFromBD ==
                                          address.text &&
                                      locationController
                                          .userAddressFromBD.isNotEmpty)) {
                                CustomSnackbar(
                                  'Address already saved.',
                                  title: 'Address',
                                  AppColors.mainColor,
                                );
                              } else {
                                final user =
                                    Get.find<PersonController>().userInfo;
                                final AddressModel addressModel = AddressModel(
                                  userId: user.id,
                                  addressType: locationController
                                      .addressTypeList[
                                          locationController.addressTypeIndex]
                                      .toString(),
                                  contactPersonName:
                                      contactPersonName.text.toString(),
                                  contactPersonNumber:
                                      contactPersonNumber.text.toString(),
                                  address: address.text.toString(),
                                  latitude: 'none',
                                  longitude: 'none',
                                );
                                locationController
                                    .saveUserAddress(addressModel)
                                    .then(
                                  (status) {
                                    if (status.isSuccess) {
                                      // To update home address UI
                                      Get.find<LocationController>()
                                          .getAddressDataFromDatabase();
                                      CustomSnackbar(
                                        'Address saved succefully.',
                                        title: 'Address',
                                        AppColors.mainColor,
                                      );
                                    } else {
                                      CustomSnackbar(
                                        'Failed to save the address',
                                        title: 'Address',
                                        Colors.redAccent,
                                      );
                                    }
                                  },
                                );
                              }
                            }
                          },
                          child: Center(
                            child: Text(
                              'save_address'.tr,
                              style: robotoBold.copyWith(
                                fontSize: 22.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
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
}
