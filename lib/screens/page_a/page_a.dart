import 'package:flutter/material.dart';
import 'package:srs/widgets/rect_action_button.dart';
import 'package:srs/widgets/infraction_item.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              //color: Colors.blueAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/rav_4.png'),
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
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Colors.white),
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
                    Text('Toyota Rav 4 2017'),
                    Text('123456789'),
                    Text('BB 3412'),
                  ],
                ),
              ],
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
          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              InfractionItem(
                  title: "Excès",
                  iconUrl: "assets/icons/speeding.png",
                  count: 3,
                  isSelected: false),
              InfractionItem(
                  title: "Usage. tel",
                  iconUrl: "assets/icons/no_phone.png",
                  count: 5,
                  isSelected: false),
              InfractionItem(
                  title: "Dépassement interdit",
                  iconUrl: "assets/icons/no_overtaking.png",
                  count: 9,
                  isSelected: false),
              InfractionItem(
                  title: "Usage. tel",
                  iconUrl: "assets/icons/distance.png",
                  count: 9,
                  isSelected: false),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          RectActionButton(
              action: "voir plus",
              onPressed: () {},
              icon: "assets/icons/more.png")
        ],
      ),
    ));
  }
}
