import 'package:flutter/material.dart';
import 'package:jox/controller/shirt_controller.dart';
import 'package:get/get.dart';
class App extends StatelessWidget {
  ShirtController shirt=Get.put(ShirtController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Bag",
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.w800, color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Flexible(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _ShirtCard(shirt.shirtInfo, index);
                  },
                )),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount:",
                          style: TextStyle(fontSize: 22),
                        ),
                        Obx((){
                          return Text(
                            "${shirt.sum}\$",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          );
                        })
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.snackbar("Congratulation","YOu just made it!!");
                      // var stk = SnackBar(
                      //   content: Text("Congratulations!"),
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(stk);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(20),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(28)),
                      child: Text(
                        "CHECK OUT",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _ShirtCard(List<dynamic> arr, int index) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black26, width: 0.2)),
      child: Row(
        children: [
          Obx((){
            return Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("${arr[index]['shirt_pic']}"),
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
            );
          }),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx((){
                          return  Text(
                            "${arr[index]['shirt_name']}",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w500),
                          );
                        }),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
                      ],
                    ),
                    Row(
                      children: [
                        Obx((){
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Color: ',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                ),
                                TextSpan(
                                  text: '${arr[index]['shirt_color']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        Obx((){
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Size: ',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                ),
                                TextSpan(
                                  text: '${arr[index]['shirt_size']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(1),
                                          spreadRadius: 0.5,
                                          blurRadius: 0.1,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                onTap: () {
                                  shirt.increase_sum(index);
                                },
                              ),
                              Obx((){
                                return Text(
                                  "${shirt.getCount(index)}",
                                  style: TextStyle(fontSize: 32),
                                );
                              }),
                              GestureDetector(
                                child: Container(
                                  child: Text(
                                    "-",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(1),
                                          spreadRadius: 0.5,
                                          blurRadius: 0.1,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                onTap: () {
                                  shirt.decrease_sum(index);
                                },
                              ),
                            ],
                          ),
                          height: 50,
                          width: 150,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          child: Obx((){
                            return Text(
                              "${arr[index]['shirt_price']}\$",
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            );
                          })
                        )
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}