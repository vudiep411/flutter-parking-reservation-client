import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class CustomCard extends StatelessWidget {
  final String parkingSpotId;
  final String rate;
  final int idx;
  const CustomCard(
      {super.key,
      required this.parkingSpotId,
      required this.rate,
      required this.idx});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        title: Text(parkingSpotId),
        // ignore: prefer_interpolation_to_compose_strings
        subtitle: Text('Rate: \$' + rate + '/hr'),
        trailing: ElevatedButton(
          onPressed: () {
            print('Press: $idx');
          },
          style: Theme.of(context).brightness == Brightness.dark
              ? ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[
                      800]), // Adjust this to your preferred dark mode color
                )
              : null,
          child: const Text(
              'Reserve'), // Null means use the default style for other themes
        ),
      ),
    );
  }
}
