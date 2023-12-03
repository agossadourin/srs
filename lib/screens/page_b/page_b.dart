import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:srs/controllers/nav_controller.dart';
import 'package:srs/screens/page_b/service_details.dart';
import 'package:srs/widgets/large_service_item.dart';
import 'package:srs/widgets/service_item.dart';

class PageB extends StatelessWidget {
  PageB({super.key});

  Future<List<String>> _getCurrentLocation() async {
    PermissionStatus permission = await Permission.location.status;

    if (permission != PermissionStatus.granted) {
      PermissionStatus newPermission = await Permission.location.request();

      if (newPermission != PermissionStatus.granted) {
        throw Exception('Location permissions denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    List<String> location = [
      placemarks[0].street.toString(),
      placemarks[0].subAdministrativeArea.toString(),
      placemarks[0].country.toString(),
    ];

    return location; // returns 'Unknown' if locality is null
  }

  final List<String> servicesList = [
    'Lavage',
    'Mécanicien',
    'Electricien',
    'Dépanneuse'
  ];

  final List<String> iconsList = [
    'assets/icons/car_wash.png',
    'assets/icons/car_repair.png',
    'assets/icons/electrician.png',
    'assets/icons/towing.png'
  ];

  final List<List<String>> titles = [
    ['Azowator et fils lavage', 'Lavage Bain de Dieu', 'Tout propre lavage'],
    ['God Mécanique auto', 'Vinanblo garage', 'Zofortos'],
    ['Lumiere électricité', 'Ets les fils', 'Ets Albarka'],
    ['Zofortos depannage', 'Ets Nonvi dep.', 'ETS Urgent'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.05,
                    height: MediaQuery.of(context).size.width * 0.05,
                    decoration: const BoxDecoration(
                      //color: Colors.blueAccent,
                      image: DecorationImage(
                        image: AssetImage('assets/icons/location.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const Text('Votre position actuelle'),
                      FutureBuilder<List<String>>(
                        future: _getCurrentLocation(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // print("***\n***");
                            // print(snapshot.data!);
                            return Text(
                              '${snapshot.data![0]}, ${snapshot.data![1]}, ${snapshot.data![2]}',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Error: ${snapshot.error}',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }

                          // While the location is being fetched, show a loading spinner.
                          return const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Chercher un sevice',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Handle search input
                },
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Services',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //horizontal line
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const Wrap(
            spacing: 15,
            runSpacing: 10,
            children: [
              ServiceItem(
                title: "Lavage",
                iconUrl: "assets/icons/car_wash.png",
                index: 0,
              ),
              ServiceItem(
                title: "Mécanicien",
                iconUrl: "assets/icons/car_repair.png",
                index: 1,
              ),
              ServiceItem(
                title: "Electricien",
                iconUrl: "assets/icons/electrician.png",
                index: 2,
              ),
              ServiceItem(
                title: "Dépanneuse",
                iconUrl: "assets/icons/towing.png",
                index: 3,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Obx(() => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(servicesList[
                        Get.find<NavController>().servicesSelectedIndex.value]),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              const Text('Voir plus',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 10)),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.39,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: Obx(() => ListView(
                  children: [
                    LargeServiceItem(
                        onTap: () {
                          Get.to(() => ServiceDetails(
                              name: titles[Get.find<NavController>()
                                  .servicesSelectedIndex
                                  .value][0],
                              surname: servicesList[Get.find<NavController>()
                                  .servicesSelectedIndex
                                  .value],
                              image: iconsList[Get.find<NavController>()
                                  .servicesSelectedIndex
                                  .value],
                              note: 7));
                        },
                        title: titles[Get.find<NavController>()
                            .servicesSelectedIndex
                            .value][0],
                        iconUrl:
                            "assets/images/${Get.find<NavController>().servicesSelectedIndex.value + 2}.jpg"),
                    LargeServiceItem(
                        onTap: () {
                          Get.to(() => ServiceDetails(
                              name: titles[Get.find<NavController>()
                                  .servicesSelectedIndex
                                  .value][1],
                              surname: servicesList[Get.find<NavController>()
                                  .servicesSelectedIndex
                                  .value],
                              image: iconsList[Get.find<NavController>()
                                  .servicesSelectedIndex
                                  .value],
                              note: 7));
                        },
                        title: titles[Get.find<NavController>()
                            .servicesSelectedIndex
                            .value][1],
                        iconUrl:
                            "assets/images/${Get.find<NavController>().servicesSelectedIndex.value + 3}.jpg"),
                    LargeServiceItem(
                        onTap: () {
                          Get.to(() => ServiceDetails(
                              name: titles[Get.find<NavController>()
                                  .servicesSelectedIndex
                                  .value][2],
                              surname: servicesList[Get.find<NavController>()
                                  .servicesSelectedIndex
                                  .value],
                              image: iconsList[Get.find<NavController>()
                                  .servicesSelectedIndex
                                  .value],
                              note: 7));
                        },
                        title: titles[Get.find<NavController>()
                            .servicesSelectedIndex
                            .value][2],
                        iconUrl:
                            "assets/images/${Get.find<NavController>().servicesSelectedIndex.value + 4}.jpg"),
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
