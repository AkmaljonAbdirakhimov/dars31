import 'package:dars31/utils/extensions.dart';
import 'package:dars31/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {
      "title": "How it Works",
      "dropdown": true,
    },
    {
      "title": "Product",
      "dropdown": true,
    },
    {
      "title": "Pricing",
      "dropdown": false,
    },
    {
      "title": "Resources",
      "dropdown": true,
    },
  ];

  List<Widget> mobileAppBarActions() {
    return [
      PopupMenuButton(
        tooltip: "Menyu ochiladi",
        offset: const Offset(0, 50),
        // popUpAnimationStyle: AnimationStyle(
        //   duration: Duration(seconds: 5),
        // ),
        // shape: Border.all(color: Colors.blue),
        // surfaceTintColor: Colors.red,
        icon: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.menu),
            Text(
              "MENU",
              style: TextStyle(
                fontSize: 6,
                height: 0.5,
              ),
            ),
          ],
        ),
        itemBuilder: (ctx) {
          return [
            for (var i = 0; i < menuItems.length; i++)
              PopupMenuItem(
                child: Text(
                  menuItems[i]['title'],
                ),
              ),
          ];
        },
      )
      // Padding(
      //   padding: EdgeInsets.only(right: 16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(Icons.menu),
      //       Text(
      //         "MENU",
      //         style: TextStyle(
      //           fontSize: 6,
      //           height: 0.5,
      //         ),
      //       ),
      //     ],
      //   ),
      // )
    ];
  }

  List<Widget> desktopAppBarActions() {
    return [
      for (var i = 0; i < menuItems.length; i++)
        menuItems[i]['dropdown']
            ? PopupMenuButton(
                offset: const Offset(0, 50),
                icon: Row(
                  children: [
                    Text(
                      menuItems[i]['title'],
                      style: const TextStyle(
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    if (menuItems[i]['dropdown'])
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primaryTextColor,
                      )
                  ],
                ),
                itemBuilder: (ctx) {
                  return [
                    for (var i = 0; i < menuItems.length; i++)
                      PopupMenuItem(
                        child: Text(
                          menuItems[i]['title'],
                        ),
                      ),
                  ];
                },
              )
            : TextButton(
                onPressed: () {},
                child: Text(
                  menuItems[i]['title'],
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
      40.width(),
      TextButton(
        onPressed: () {},
        child: const Text(
          "Login",
          style: TextStyle(
            color: AppColors.primaryTextColor,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 20,
            ),
          ),
          child: const Text(
            "Get started free",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ];
  }

  Widget getEmailInput(BuildContext context) {
    return Container(
      width: context.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.terniaryTextColor,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        "name@yourcompany.com",
        style: TextStyle(
          color: Color(0xFF97A5B5),
        ),
      ),
    );
  }

  Widget getSubmitButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        width: context.width,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(
            color: AppColors.terniaryTextColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: Text(
            "Try it free",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = context.width >= 800;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFAFE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBFAFE),
        title: const Text("team.flow"),
        centerTitle: false,
        actions: isDesktop ? desktopAppBarActions() : mobileAppBarActions(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                print("Bitta");
              },
              onDoubleTap: () {
                print("Ikki marta bosildi");
              },
              onLongPress: () {
                print("Uzoq bosildi");
              },
              splashColor: const Color.fromARGB(255, 104, 221, 108),
              borderRadius: BorderRadius.circular(30),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFF2F9EB),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isDesktop)
                      Row(
                        children: [
                          Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFF81C43B),
                            ),
                            child: Text(
                              "Save 90%",
                              style: const TextStyle().paragraph.copyWith(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          8.width(),
                        ],
                      ),
                    Text(
                      "Get account of \$59",
                      style: const TextStyle().paragraph.copyWith(
                            fontSize: 13,
                            height: 1.7,
                          ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.primaryTextColor,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            16.height(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: SizedBox(
                width: 0.45.sw,
                child: Column(
                  children: [
                    Text(
                      """Manage the team everyone wants to be on""",
                      style: TextStyle(
                        fontSize: isDesktop ? 12.sp : 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: AppColors.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    16.height(),
                    const Text(
                      """Simple platform that lets you master what great managers do best, as develop trust, collaborate, and drive team performance.""",
                      style: TextStyle(
                        color: AppColors.secondaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    16.height(),
                    isDesktop
                        ? SizedBox(
                            width: 0.3.sw,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: getEmailInput(context),
                                ),
                                Expanded(
                                  child: getSubmitButton(context),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              getEmailInput(context),
                              8.height(),
                              getSubmitButton(context),
                            ],
                          )
                  ],
                ),
              ),
            ),
            32.height(),
            Image.asset(
              "assets/images/bg_bars.png",
              width: isDesktop ? 0.7.sw : null,
              fit: BoxFit.cover,
            ),
            70.height(),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                ),
                children: [
                  TextSpan(
                    text: "TRUSTED BY OVER",
                  ),
                  TextSpan(
                    text: " 10.000+ ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: "WORLD’S BEST TEAMS",
                  ),
                ],
              ),
            ),
            16.height(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/images/google.png",
                    ),
                  ),
                  32.width(),
                  Expanded(
                    child: Image.asset(
                      "assets/images/airbnb.png",
                    ),
                  ),
                  32.width(),
                  Expanded(
                    child: Image.asset(
                      "assets/images/facebook.png",
                    ),
                  ),
                  32.width(),
                  Expanded(
                    child: Image.asset(
                      "assets/images/hubspot.png",
                    ),
                  ),
                  32.width(),
                  Expanded(
                    child: Image.asset(
                      "assets/images/slack.png",
                    ),
                  ),
                ],
              ),
            ),
            100.height(),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Salom"),
            ),
            10.height(),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Salom"),
            ),
            10.height(),
            GestureDetector(
              child: Container(
                width: 100,
                height: 50,
                color: Colors.amber,
              ),
            ),
            10.height(),
            DropdownButton(
              icon: Icon(Icons.add),
              hint: const Text("Yoqtirgan mevangizni tanlang"),
              items: const [
                DropdownMenuItem(
                  value: 0,
                  child: Text("Olma"),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text("Behi"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Anor"),
                ),
              ],
              onChanged: (value) {
                print(value);
              },
            ),
            1000.height(),
          ],
        ),
      ),
    );
  }
}


 // ElevatedButton(
            //   onPressed: () {},
            //   style:

            //       // ElevatedButton.styleFrom(
            //       //   elevation: 0,
            //       //   backgroundColor: const Color(0xFFF2F9EB),
            //       //   fixedSize: const Size(160, 0),
            //       // ),

            //       const ButtonStyle(
            //     elevation: MaterialStatePropertyAll(0),
            //     backgroundColor: MaterialStatePropertyAll(
            //       Color(0xFFF2F9EB),
            //     ),
            //     fixedSize: MaterialStatePropertyAll(
            //       Size(160, 21),
            //     ),
            //   ),
            //   child: Text(
            //     "Get account of \$59",
            //     style: const TextStyle().paragraph.copyWith(
            //           fontSize: 13,
            //         ),
            //   ),
            // ),