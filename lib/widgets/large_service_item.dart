import 'package:flutter/material.dart';

class LargeServiceItem extends StatelessWidget {
  //add required title, icon and body
  final String? title;
  final String? iconUrl;
  final VoidCallback? onTap;

  const LargeServiceItem({
    Key? key,
    required this.title,
    required this.iconUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.25,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(bottom: 10),
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
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.25,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(iconUrl!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(children: [
                  Text(title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: const BoxDecoration(
                          //color: Colors.blueAccent,
                          image: DecorationImage(
                            image: AssetImage('assets/icons/location.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('1.4km a proximité')
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.001,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.access_time, size: 15),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Ouvert 24h/24')
                    ],
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}
