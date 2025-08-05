import 'package:flutter/material.dart';
import 'package:fluttter_locaquest/models/location.dart';
import 'package:fluttter_locaquest/views/review_page.dart';

class LocationTile extends StatelessWidget {
  final Location location;
  final VoidCallback? onTap;
  const LocationTile({super.key, required this.location, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: const Color.fromARGB(255, 218, 218, 218)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(location.title.replaceAll(RegExp(r'<[^>]*>'), '')),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(location.category),
                  Text(location.roadAddress),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReviewPage(
                      mapX: location.mapX,
                      mapY: location.mapY,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
