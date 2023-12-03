import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srs/controllers/nav_controller.dart';

class ServiceItem extends StatelessWidget {
  //add required title, icon and body
  final String? title;
  final String? iconUrl;

  final int? index;
  const ServiceItem({
    Key? key,
    required this.title,
    required this.iconUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.find<NavController>().servicesSelectedIndex.value = index!;
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.17,
                  height: MediaQuery.of(context).size.width * 0.17,
                  padding: const EdgeInsets.all(4),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 0.50,
                          color: Get.find<NavController>()
                                      .servicesSelectedIndex
                                      .value ==
                                  index!
                              ? const Color(0xFF00DAB7)
                              : Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 14,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 37.42,
                        height: 37.42,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 37.42,
                                height: 37.42,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(iconUrl!),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 9.36),
                    ],
                  )),
            ),
            const SizedBox(height: 9.36),
            Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Get.find<NavController>().servicesSelectedIndex.value ==
                        index!
                    ? const Color(0xFF00DAB7)
                    : const Color(0xFF202020),
                fontSize: 12.16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ));
  }
}
