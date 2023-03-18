import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sc_app/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool currentTrip = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Container(
                // height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.only(top: 50.0, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFF0EFFF),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    currentTrip
                        ? Text(
                            'Current',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF46464F),
                            ),
                          )
                        : Container(),
                    if (currentTrip)
                      SizedBox(
                        height: 10,
                      ),
                    if (currentTrip)
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF00105C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.only(
                            left: 20, top: 20, bottom: 8, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tan An, Long An',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'from Tan Binh, Ho Chi Minh City\n48km, 1 stop',
                              style: TextStyle(
                                color: Color(0xFF4556B4),
                                height: 1.6,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      'View',
                                      style: TextStyle(
                                        color: Color(0xFF00105C),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    if (currentTrip)
                      SizedBox(
                        height: 30,
                      ),
                    Text(
                      'Shortcut',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF46464F),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TripButton(
                      location: 'Ninh Kieu, Can Tho',
                      desc: '170km, 3 stops',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TripButton(
                      location: 'Ninh Kieu, Can Tho',
                      desc: '170km, 3 stops',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TripButton(
                      location: 'Ninh Kieu, Can Tho',
                      desc: '170km, 3 stops',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Review',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF46464F),
                      ),
                    ),
                    GridView.builder(
                      padding: EdgeInsets.only(
                        top: 12,
                        bottom: 30,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Ngoc Hue Canteen',
                                    style: TextStyle(
                                      fontSize: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cai Lay, Tien Giang',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[800],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -20,
              width: 320,
              child: TextField(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                onSubmitted: (value) => {
                  print(value),
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(
                    Icons.menu,
                    color: Color(0xFF2C3D9B),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF2C3D9B),
                  ),
                  filled: true,
                  fillColor: Color(0xFFDEE0FF),
                  // enabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  hintText: 'Search for location',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripButton extends StatelessWidget {
  const TripButton({
    Key? key,
    required this.location,
    required this.desc,
  }) : super(key: key);

  final String location;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      onPressed: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  location,
                  style: TextStyle(
                    color: Color(0xFF5B5D72),
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: Color(0xFF5B5D72),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF00105C),
                ),
                child: Text(
                  'Go',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
