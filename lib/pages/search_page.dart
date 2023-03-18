import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sc_app/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> startPlaces = [
        'Tieu Can Tra Vinh',
        'Di An Binh Duong',
      ],
      goPlaces = [
        'da lat',
        'vung tau',
        'long an',
      ];

  int curIndex = 0;
  bool type = true,
      isExpanded = false,
      openModal = false,
      isRoute = true,
      isCheck = false,
      isHelp = false;
  List<bool> focus = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EFFF),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            focus = [false, false];
            openModal = false;
          });
        },
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          minimumSize: Size(30, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 24,
                          color: Color(0xFF5B5D72),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          // width: 300,
                          child: TextField(
                            onTap: () {
                              setState(() {
                                type = true;
                                focus[0] = true;
                                focus[1] = false;
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 12),
                              fillColor: focus[0]
                                  ? Color(0xFFE0E1F9)
                                  : Colors.transparent,
                              filled: true,
                              hintText: 'Your start',
                              hintStyle: TextStyle(
                                fontWeight: focus[0]
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: 20,
                                height: 1.4,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E1F9),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E1F9),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: Icon(
                                Icons.trip_origin_sharp,
                                color: Color(0xFF4556B4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            openModal = !openModal;
                          });
                        },
                        style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.all(0),
                          minimumSize: Size(26, 26),
                        ),
                        child: Icon(
                          Icons.more_vert,
                          size: 26,
                          color: Color(0xFF5B5D72),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 62.0,
                            right: 58.0,
                          ),
                          child: Container(
                            // width: 300,
                            child: TextField(
                              onTap: () {
                                setState(() {
                                  type = false;
                                  focus[1] = true;
                                  focus[0] = false;
                                });
                              },
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                fillColor: focus[1]
                                    ? Color(0xFFE0E1F9)
                                    : Colors.transparent,
                                filled: true,
                                contentPadding: EdgeInsets.all(0),
                                hintText: 'Where to?',
                                hintStyle: TextStyle(
                                  fontWeight: focus[1]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 20,
                                  height: 1.4,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E1F9),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E1F9),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabled: true,
                                prefixIcon: Icon(
                                  Icons.trip_origin_rounded,
                                  color: Color(0xFFBA1A1A),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 5,
                    color: Color(0xFFE0E1F9),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (focus[0] || focus[1])
                    Expanded(
                      child: _PlaceSuggestion(
                          type: type,
                          startPlaces: startPlaces,
                          goPlaces: goPlaces),
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '1 hr 3 min ',
                                    style: TextStyle(
                                      color: Color(0xFF00105C),
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '(48km)',
                                    style: TextStyle(
                                      color: Color(0xFF5B5D72),
                                      fontSize: 32,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Fastest route now due to traffic condition',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFFC7C5D0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          height: 0,
                          thickness: 3,
                          color: Color(0xFFE0E1F9),
                        ),
                      ],
                    ),
                  isRoute
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return isExpanded
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30.0,
                                        bottom: 10.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                isExpanded = !isExpanded;
                                              });
                                            },
                                            style: TextButton.styleFrom(
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              padding: EdgeInsets.all(0),
                                            ),
                                            child: Icon(
                                              Icons.expand_more_rounded,
                                              size: 60,
                                              color: Color(0xFFE0E1F9),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Head toward ',
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        color:
                                                            Color(0xFF5B5D72),
                                                      ),
                                                    ),
                                                    Text(
                                                      'QL1A',
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF0E2384),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '9.1 km',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xFFE0E1F9),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        height: 3,
                                                        color:
                                                            Color(0xFFE0E1F9),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isExpanded = !isExpanded;
                                                  });
                                                },
                                                style: TextButton.styleFrom(
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  padding: EdgeInsets.all(0),
                                                ),
                                                child: Icon(
                                                  Icons.chevron_right_rounded,
                                                  size: 60,
                                                  color: Color(0xFFE0E1F9),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .turn_right_rounded,
                                                          size: 40,
                                                          color:
                                                              Color(0xFF5B5D72),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            'Turn right toward Truong Chinh',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color: Color(
                                                                  0xFF5B5D72),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 42,
                                                        ),
                                                        Text(
                                                          '60 m',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20,
                                                            color: Color(
                                                                0xFFE0E1F9),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Flexible(
                                                          child: Container(
                                                            height: 3,
                                                            color: Color(
                                                                0xFFE0E1F9),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .turn_right_rounded,
                                                          size: 40,
                                                          color:
                                                              Color(0xFF5B5D72),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            'Turn right toward Truong Chinh',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color: Color(
                                                                  0xFF5B5D72),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 42,
                                                        ),
                                                        Text(
                                                          '60 m',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20,
                                                            color: Color(
                                                                0xFFE0E1F9),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Flexible(
                                                          child: Container(
                                                            height: 3,
                                                            color: Color(
                                                                0xFFE0E1F9),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                        )
                      : Container(),
                  isCheck
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                            right: 12.0,
                            top: 30.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Protective Clothing',
                                style: TextStyle(
                                  color: Color(0xFF46464F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CheckboxListTile(
                                    checkColor: Colors.white,
                                    activeColor: Color(0xFF00105C),
                                    value: true,
                                    onChanged: (value) {
                                      value = !value!;
                                    },
                                    title: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDEE0FF),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Icon(
                                            Icons.umbrella_rounded,
                                            size: 24,
                                            color: Color(0xFF4556B4),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          'Raincoat',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CheckboxListTile(
                                    checkColor: Colors.white,
                                    activeColor: Color(0xFF00105C),
                                    value: true,
                                    onChanged: (value) {
                                      value = !value!;
                                    },
                                    title: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDEE0FF),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Icon(
                                            Icons.umbrella_rounded,
                                            size: 24,
                                            color: Color(0xFF4556B4),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          'Raincoat',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CheckboxListTile(
                                    checkColor: Colors.white,
                                    activeColor: Color(0xFF00105C),
                                    value: true,
                                    onChanged: (value) {
                                      value = !value!;
                                    },
                                    title: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDEE0FF),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Icon(
                                            Icons.umbrella_rounded,
                                            size: 24,
                                            color: Color(0xFF4556B4),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          'Raincoat',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  isHelp
                      ? Padding(
                          padding: const EdgeInsets.all(
                            12.0,
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(14.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tan An's Police",
                                              style: TextStyle(
                                                fontSize: 32,
                                              ),
                                            ),
                                            Text(
                                              "0909099999",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Color(0xFF00105C),
                                          ),
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.phone,
                                            size: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Divider(
                                      height: 3,
                                      thickness: 2,
                                      color: Color(0xFFF0EFFF),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          '99 Chau Thi Kim, Ward 7, Tan An, Long An',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 3,
                                      thickness: 2,
                                      color: Color(0xFFF0EFFF),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.schedule_outlined,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          'Open 07:00 - Closed 17:00',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
              openModal
                  ? Positioned(
                      top: 50,
                      right: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Send to Google Maps',
                                style: TextStyle(
                                  color: Color(0xFF5B5D72),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Save route',
                                style: TextStyle(
                                  color: Color(0xFF5B5D72),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                  color: Color(0xFF5B5D72),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        currentIndex: curIndex,
        onTap: (index) {
          setState(() {
            curIndex = index;
            if (curIndex == 0) {
              isRoute = true;
              isCheck = isHelp = false;
            }
            if (curIndex == 1) {
              isCheck = true;
              isRoute = isHelp = false;
            }
            if (curIndex == 2) {
              isHelp = true;
              isCheck = isRoute = false;
            }
          });
        },
        selectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        backgroundColor: Color(0xFFF0EFFF),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF00105C),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: curIndex == 0 ? Color(0xFF00105C) : Colors.transparent,
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(
                    color: Color(0xFF00105C),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      size: 30,
                    ),
                    Text(
                      'Route',
                      style: TextStyle(
                        color: curIndex == 0 ? Colors.white : Color(0xFF00105C),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: curIndex == 1 ? Color(0xFF00105C) : Colors.transparent,
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(
                    color: Color(0xFF00105C),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.text_snippet_outlined,
                      size: 30,
                    ),
                    Text(
                      'Check',
                      style: TextStyle(
                        color: curIndex == 1 ? Colors.white : Color(0xFF00105C),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: curIndex == 2 ? Color(0xFF00105C) : Colors.transparent,
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(
                    color: Color(0xFF00105C),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.local_hospital_outlined,
                      size: 30,
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                        color: curIndex == 2 ? Colors.white : Color(0xFF00105C),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _SinglePlaceDetail extends StatefulWidget {
  const _SinglePlaceDetail({
    Key? key,
    required this.direction,
    required this.place,
    required this.distance,
    required this.detailNav,
  }) : super(key: key);

  final String direction, place, distance;
  final List<String> detailNav;

  @override
  State<_SinglePlaceDetail> createState() => _SinglePlaceDetailState();
}

class _SinglePlaceDetailState extends State<_SinglePlaceDetail> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        top: 35.0,
        bottom: 10.0,
      ),
      child: Row(
        children: [
          Icon(
            Icons.expand_more_rounded,
            size: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.direction,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.place,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      '${widget.distance} km',
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.black,
                      height: 3,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _PlaceSuggestion extends StatelessWidget {
  const _PlaceSuggestion({
    Key? key,
    required this.type,
    required this.startPlaces,
    required this.goPlaces,
  }) : super(key: key);

  final bool type;
  final List startPlaces;
  final List goPlaces;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
      ),
      child: ListView.builder(
        itemCount: type ? startPlaces.length : goPlaces.length,
        itemBuilder: ((context, index) {
          List<dynamic> cur = [];
          if (type) {
            cur = startPlaces;
          } else {
            cur = goPlaces;
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextButton(
              style: TextButton.styleFrom(
                // padding: EdgeInsets.all(0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    type ? Icons.refresh : Icons.show_chart,
                    color: Color(0xFF625B71),
                    size: 28,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    cur[index],
                    style: TextStyle(
                      color: Color(0xFF5B5D72),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Expanded(
//                                       child: Row(
//                                         children: [
//                                           Icon(
//                                             Icons.turn_right_rounded,
//                                             size: 40,
//                                           ),
//                                           Container(
//                                             width: 280,
//                                             child: Text(
//                                               'Turn right toward Truong Chinh',
//                                               style: TextStyle(
//                                                 fontSize: 18,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             '60 m',
//                                           ),
//                                           SizedBox(
//                                             width: 12,
//                                           ),
//                                           Container(
//                                             height: 3,
//                                             color: Colors.black,
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )