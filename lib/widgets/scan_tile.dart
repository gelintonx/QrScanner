import 'package:QrScanner/models/scan_model.dart';
import 'package:QrScanner/providers/scan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

class ScanTile extends StatelessWidget {
  final ScanModel scan;
  final String type;

  ScanTile({@required this.scan, @required this.type});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScanProvider>(context);

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) => provider.deleteScanById(scan.id),
      child: ListTile(
        onTap: () {
          if (scan.type == 'http') {
            launchURL(scan.value);
          } else {
            Navigator.pushNamed(context, '/map', arguments: scan);
          }
        },
        title: Text(scan.value),
        subtitle: Text('ID ${scan.id}'),
        leading: Icon(
          type == 'http' ? Icons.web : Icons.map,
          color: Theme.of(context).primaryColor,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
