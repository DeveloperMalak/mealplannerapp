import 'package:daily_recipe/Controllers/recipecontrollers.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

Widget dropdownButton(String initialvalue) {
var recipescontroller = Get.find<Recipecontrollers>();
  return StatefulBuilder(
    // ignore: avoid_types_as_parameter_names
    builder: (BuildContext, setState) => SizedBox(
        height: 50,
        width: 100,
        child: Obx(
          () => DropdownButton(
            isExpanded: true,
            value: initialvalue,
            items:
                recipescontroller.recipesList.map<DropdownMenuItem>((valued) {
                  return DropdownMenuItem(
                    value: valued.sId,
                    child: Text(valued.name),
                  );
                }).toList(),
            onChanged: (value) {
              setState(() {
                initialvalue = value;
              });
            },
          ),
        ),
      ),
  );
}
