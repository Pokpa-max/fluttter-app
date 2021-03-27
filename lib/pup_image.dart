class PupImage {
  String image;
  PupImage(this.image);
}

List<PupImage> imagedefile =
    imagesData.map((item) => PupImage(item['image'])).toList();
var imagesData = [
  {'image': 'assets/imagesPub/pub1.jpg'},
  {'image': 'assets/imagesPub/pub2.jpg'},
  {'image': 'assets/imagesPub/pub3.jpg'},
  {'image': 'assets/imagesPub/pub4.jpg'},
  {'image': 'assets/imagesPub/pub5.jpg'},
  {'image': 'assets/imagesPub/pub6.jpg'},
];
