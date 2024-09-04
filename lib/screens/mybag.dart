import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int sum = 0;

  List<int> counters = [0, 0, 0];

  var shirtInfo = [
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
  ];

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
                  itemCount: shirtInfo.length,
                  itemBuilder: (context, index) {
                    return _ShirtCard(shirtInfo, index);
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
                        Text(
                          "$sum\$",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      var stk = SnackBar(
                        content: Text("Congratulations!"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(stk);
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
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${arr[index]['shirt_pic']}"),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${arr[index]['shirt_name']}",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
                      ],
                    ),
                    Row(
                      children: [
                        RichText(
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
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
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
                        ),
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
                                  setState(() {
                                    counters[index]++;
                                    sum += int.parse(arr[index]['shirt_price']);
                                  });
                                },
                              ),
                              Text(
                                "${counters[index]}",
                                style: TextStyle(fontSize: 32),
                              ),
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
                                  setState(() {
                                    if (counters[index] == 0) {
                                      showDialog<void>(
                                        context: context,
                                        builder: (BuildContext dialogContext) {
                                          return AlertDialog(
                                            title: Text('Warning'),
                                            content: Text(
                                                'Oops! You can\'t decrease the value any further.'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Close'),
                                                onPressed: () {
                                                  Navigator.of(dialogContext)
                                                      .pop(); // Dismiss alert dialog
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      return;
                                    }
                                    counters[index]--;
                                    sum -= int.parse(arr[index]['shirt_price']);
                                  });
                                },
                              ),
                            ],
                          ),
                          height: 50,
                          width: 150,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          child: Text(
                            "${arr[index]['shirt_price']}\$",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
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
