import 'package:belajar_getx/app/helper/costume_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Column(
              children: [
                SizedBox(height: 115.h),
                Image.asset('assets/LOGO.png', width: 120.w, height: 120.h),
                SizedBox(height: 115.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 30.h,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 35.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(39.r),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 57.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 60.h),
                      CusTextField(
                        controller: controller.nimController,
                        label: 'NIM',
                        isAngka: true,
                        usePrefixIcon: true,
                        prefixIcon: Icon(Icons.mail),
                      ),
                      SizedBox(height: 31.h),
                      Obx(
                        () => CusTextField(
                          controller: controller.passwordController,
                          label: 'Password',
                          isHidden: controller.isHidden.value,
                          isPassword: true,
                          usePrefixIcon: true,
                          prefixIcon: Icon(Icons.password),
                          onToggleVisibility: () =>
                              controller.isHidden.toggle(),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Forgot password? '),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Click here',
                              style: TextStyle(color: Colors.amber),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                      ElevatedButton(
                        onPressed: () {
                          controller.isLogin();
                        },
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 15.h),
                          ),
                          elevation: WidgetStatePropertyAll(0),
                          backgroundColor: WidgetStatePropertyAll(Colors.amber),
                          minimumSize: WidgetStatePropertyAll(
                            Size(344.w, 40.h),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
