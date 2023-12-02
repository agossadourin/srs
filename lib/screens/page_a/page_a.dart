import 'package:flutter/material.dart';
import 'package:srs/widgets/service_item.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text('Bienvenue', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor:
              Colors.blueGrey, // make AppBar background transparent
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Image(
                  image: AssetImage('assets/icons/Notifications.png')),
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  //color: Colors.blueAccent,
                  image: DecorationImage(
                    image: AssetImage('assets/images/toyota.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.17,
                      color: Colors.grey,
                    ),
                    const Text(
                      'Informations personnelles',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //horizontal line
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.17,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Card(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nom et prénom.s:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Modèle véhicule:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('numéro de chassis:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('numéro de plaque:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe'),
                          Text('Toyota Camry 2017'),
                          Text('123456789'),
                          Text('BB 3412'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.17,
                      color: Colors.grey,
                    ),
                    const Text(
                      'Infractions commises',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //horizontal line
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.17,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceItem(
                      title: "Excès",
                      iconUrl: "assets/icons/Notifications.png",
                      isSelected: false),
                  ServiceItem(
                      title: "Stationnement",
                      iconUrl: "assets/icons/Notifications.png",
                      isSelected: false),
                  ServiceItem(
                      title: "Feu rouge",
                      iconUrl: "assets/icons/Notifications.png",
                      isSelected: false),
                ],
              )
            ],
          ),
        ));
  }
}
