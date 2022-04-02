import 'package:example/model/data_hub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

class Slide extends StatelessWidget {
  const Slide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataHub>(
      builder: (context, dataImage, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(

          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          child: ImageSlideshow(
            /// Width of the [ImageSlideshow].
            width: 200,

            /// Height of the [ImageSlideshow].
            height: 80,

            /// The page to show when first creating the [ImageSlideshow].
            initialPage: 0,

            /// The color to paint the indicator.
            indicatorColor: Colors.blue,

            /// The color to paint behind th indicator.
            indicatorBackgroundColor: Colors.grey,

            /// The widgets to display in the [ImageSlideshow].
            /// Add the sample image file into the images folder
            children: dataImage.pdfList
                .map(
                  (e) => Image.network(
                    'http://192.168.1.11:8080/${e['cover_image']}',
                    fit: BoxFit.fitHeight
                  ),
                )
                .toList(),

            /// Called whenever the page in the center of the viewport changes.
            onPageChanged: (value) {
              // print('Page changed: $value');
            },

            /// Auto scroll interval.
            /// Do not auto scroll with null or 0.
            autoPlayInterval: 3000,

            /// Loops back to first slide.
            isLoop: true,
          ),
        ),
      ),
    );
  }
}
