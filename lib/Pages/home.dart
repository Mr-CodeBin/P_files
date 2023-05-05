import 'package:engage_files/responsivescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];

  List<String> textList = [
    'Girl-4056684',
    'Clock-5834193',
    'Laptop-5582775',
    'Woman-kayaking',
    'Cellular-4602489',
    'Christmas-2059698',
    'Snowboard-480305',
    'University-library',
    'Cat-5767334',
    'Snow-5828736',
    'Women-5816861',
  ];

  List priceList = [
    '120',
    '140',
    '150',
    '978',
    '1999',
    '9999',
    '999',
    '2799',
    '1899',
    '899',
    '719',
  ];

  List category = [
    'Special Price',
    'Special Price',
    'Special Price',
    'Special Price',
    'Special Price',
  ];

  TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Discover Product",
                    style: GoogleFonts.montserrat(
                        fontSize: ResponsiveScreen.halfRepWidth(context, 30),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              TextField(
                controller: _searchcontroller,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: "Search",
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: ResponsiveScreen.halfRepWidth(context, 16),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                  border: UnderlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(8, 18, 8, 20),
                ),
              ),
              SizedBox(
                height: ResponsiveScreen.fullRepHeight(context, 18),
              ),
              Container(
                height: ResponsiveScreen.halfRepHeight(context, 40),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 4.0),
                      child: Container(
                        height: ResponsiveScreen.halfRepHeight(context, 30),
                        width: ResponsiveScreen.halfRepWidth(context, 100),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${category[index]}",
                            style: GoogleFonts.roboto(
                              fontSize:
                                  ResponsiveScreen.halfRepWidth(context, 14),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: ResponsiveScreen.fullRepHeight(context, 8),
              ),
              Expanded(
                child: MasonryGridView.builder(
                  itemCount: imageList.length,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                imageList[index],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveScreen.fullRepHeight(context, 4),
                          ),
                          Center(
                            child: Text(
                              textList[index],
                              style: GoogleFonts.montserrat(
                                fontSize:
                                    ResponsiveScreen.halfRepWidth(context, 12),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "\$ " +
                                      ((int.parse(priceList[index]) + 100)
                                          .toString()) +
                                      "/-",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.blue[200],
                                    fontSize: ResponsiveScreen.halfRepWidth(
                                        context, 12),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    ResponsiveScreen.halfRepWidth(context, 4),
                              ),
                              Center(
                                child: Text(
                                  "\$ " + priceList[index] + "/-",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.blue[700],
                                    fontSize: ResponsiveScreen.halfRepWidth(
                                        context, 12),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
