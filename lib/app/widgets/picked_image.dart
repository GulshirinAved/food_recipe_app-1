import 'package:flutter/cupertino.dart';

import '../core/constants.dart';

Container pickedImage(image) {
  return Container(
    height: 230,
    width: 350,
    padding: const EdgeInsets.only(top: 25),
    child: ClipRRect(
      borderRadius: borderRadius30,
      child: Image.file(
        image,
        fit: BoxFit.cover,
      ),
    ),
  );
}
