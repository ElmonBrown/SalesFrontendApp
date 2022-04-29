import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/presentation.dart';

class PresentationPicker extends StatefulWidget {
  const PresentationPicker({Key? key, required this.presentations}) : super(key: key);
  final List<Presentation>? presentations;
  @override
  State<PresentationPicker> createState() => _PresentationPickerState();
}

class _PresentationPickerState extends State<PresentationPicker> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing: 8,
      children: List<Widget>.generate(
        widget.presentations?.length ?? 0,
            (int index) {
          return ChoiceChip(
              label: Text(widget.presentations?[index].name ?? ''),
              selected: index == _value,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                });
              });
        },
      ).toList(),
    );
  }
}
