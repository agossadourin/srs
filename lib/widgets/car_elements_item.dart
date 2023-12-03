import 'package:flutter/material.dart';

class CarElementsItem extends StatelessWidget {
  //add required title, icon and body
  final String? title;
  final String? iconUrl;
  final String? bodyText;
  final int? count;
  final VoidCallback? onTap;

  const CarElementsItem({
    Key? key,
    required this.title,
    required this.bodyText,
    required this.count,
    required this.iconUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
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
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(" ${title!}:",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(
                            ' ${count!}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: count! < 5
                                    ? Colors.red
                                    : count! < 9
                                        ? Colors.yellow
                                        : Colors.green),
                          ),
                          const Text(' Jours restants',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10))
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 15),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(bodyText!)
                        ],
                      ),
                    ]),
              ),
            ],
          )),
    );
  }
}
