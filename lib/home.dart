import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class Home extends StatelessWidget {
  final List<dynamic> data;

  const Home({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(5.0),
            child: ListTile(
              title: Text(data[index]['parking_spot_id']),
              // ignore: prefer_interpolation_to_compose_strings
              subtitle: Text('Rate: \$' + data[index]['rate'] + '/hr'),
              trailing: ElevatedButton(
                onPressed: () {
                  print('Press: $index');
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
        });
  }
}
