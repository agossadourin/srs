import 'package:flutter/material.dart';
import 'package:srs/widgets/car_elements_item.dart';
import 'package:srs/widgets/rect_action_button.dart';
import 'package:srs/widgets/infraction_item.dart';

class PageC extends StatelessWidget {
  const PageC({super.key});

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
                image: AssetImage('assets/images/car_repair.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
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
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Text(
                      '9/10',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Etat Général',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, \n consectetur adipiscing elit.',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                    ],
                  )
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Eléments',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CarElementsItem(
                title: "Vidange",
                bodyText: 'Vous avez fait la dernière \n vidange le 12/12/2020',
                count: 25,
                iconUrl: "assets/icons/engine_oil.png",
                onTap: () {},
              ),
              CarElementsItem(
                title: "Freinage",
                bodyText: 'Votre sytème de freinage \n repond moins vite',
                count: 3,
                iconUrl: "assets/icons/brake_disc.png",
                onTap: () {},
              ),
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
