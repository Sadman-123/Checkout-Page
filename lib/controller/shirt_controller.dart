import 'package:get/get.dart';

class ShirtController extends GetxController {
  RxInt sum = 0.obs;
  RxInt s1 = 0.obs;
  RxInt s2 = 0.obs;
  RxInt s3 = 0.obs;

  RxList<dynamic> shirtInfo = [
    {
      "shirt_pic": "assets/pullover.png",
      "shirt_name": "Pullover",
      "shirt_color": "black",
      "shirt_size": "L",
      "shirt_price": "51"
    },
    {
      "shirt_pic": "assets/tshirt.png",
      "shirt_name": "T-Shirt",
      "shirt_color": "Gray",
      "shirt_size": "L",
      "shirt_price": "30"
    },
    {
      "shirt_pic": "assets/sport.png",
      "shirt_name": "Sport Dress",
      "shirt_color": "Black",
      "shirt_size": "M",
      "shirt_price": "43"
    },
  ].obs;

  RxInt getCount(int index) {
    if (index == 0) {
      return s1;
    } else if (index == 1) {
      return s2;
    } else {
      return s3;
    }
  }

  void increase_sum(int index) {
    if (index == 0) {
      s1.value += 1;
      sum.value += 51;
    } else if (index == 1) {
      s2.value += 1;
      sum.value += 30;
    } else {
      s3.value += 1;
      sum.value += 43;
    }
  }

  void decrease_sum(int index) {
    if (index == 0 && s1.value > 0) {
      s1.value -= 1;
      sum.value -= 51;
    } else if (index == 1 && s2.value > 0) {
      s2.value -= 1;
      sum.value -= 30;
    } else if (index == 2 && s3.value > 0) {
      s3.value -= 1;
      sum.value -= 43;
    }
  }
}
