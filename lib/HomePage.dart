import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }
  Widget _tabItem(Widget child, String label, {bool isSelected = false}) {
    return AnimatedContainer(
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),

        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            child,
            Text(label, style: TextStyle(fontSize: 8)),
          ],
        ));
  }
  final List<String> _labels = ['Home', 'Courses', 'Trending','My Profile'];
  @override
  Widget build(BuildContext context) {
    List<Widget> _icons = const [
      Icon(Icons.home_filled),
      Icon(Icons.play_circle),
      Icon(Icons.trending_up_sharp),
      Icon(Icons.person)
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("assets/images/Cipherschools.png"),
        title: Text("CipherSchools",style: TextStyle(
          color: Colors.black
        ),),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.menu),color: Colors.black,)
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [

            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,

              offset: Offset(0, 0),
              blurRadius: 1000.0,
            ),
          ],
        ),
        height: 90,
        padding: const EdgeInsets.all(15),
        child: ClipRRect(

          borderRadius: BorderRadius.circular(50.0),
          child: Container(

            color: Colors.white,

            child: TabBar(
                onTap: (x) {
                  setState(() {
                    _selectedIndex = x;
                  });
                },
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.black,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                tabs: [
                  for (int i = 0; i < _icons.length; i++)
                    _tabItem(
                      _icons[i],
                      _labels[i],
                      isSelected: i == _selectedIndex,
                    ),
                ],
                controller: _tabController),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        RichText(
        text: TextSpan(
        style: new TextStyle(
          fontSize: 40.0,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
        children: <TextSpan>[
          TextSpan(text: 'Welcome to '),
          TextSpan(text: 'the ', style: new TextStyle(color: Colors.orange)),
        ],
    ),
    ),
            RichText(
              text: TextSpan(
                style: new TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                    fontWeight: FontWeight.bold

                ),
                children: <TextSpan>[
                  TextSpan(text: 'Future ', style: new TextStyle(color: Colors.orange)),
                  new TextSpan(text: 'of Learning!'),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text("Start Learning by best creators for",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),),
            Text("absolutely Free|" ,style: TextStyle(color: Colors.orange,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(

                    children: [
                      Text("50+",style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      Text("Mentors",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Divider(color: Colors.grey,),
                  Column(
                    children: [
                      Text("4.8/5",style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded,color: Colors.orange,),
                          Icon(Icons.star_rate_rounded,color: Colors.orange,),
                          Icon(Icons.star_rate_rounded,color: Colors.orange,),
                          Icon(Icons.star_rate_rounded,color: Colors.orange,),
                          Icon(Icons.star_half_rounded,color: Colors.orange,),
                          Text("Ratings",style: TextStyle(
                            fontWeight: FontWeight.w200
                          ),)

                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
                SizedBox(height: 50,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    child: Center(child: Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text("Start Learning Now",style: TextStyle(color:  Colors.white,fontSize: 12),),
                        ),
                        SizedBox(width: 3,),
                        Icon(Icons.arrow_forward,color: Colors.white,)
                      ],
                    )),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade600,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 200,
                  ),
                ),
            SizedBox(height: 80,),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.80), borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage("assets/images/icon.png"),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    ClipPath(
                      clipper: BestSellerClipper(),
                      child: Container(
                        color: Colors.orange,
                        height: 30,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30,top: 5),
                          child: Text(
                            "Free".toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],),
                  SizedBox(height:20 ,),
                  Padding(
                    padding: const EdgeInsets.only(right: 90),
                    child: Text("Projects",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Get hands on experience with real-time projects guided by expert mentors",style: TextStyle(
                        color: Colors.white,
                        fontSize: 10
                    ),),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

}
class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width-60, size.height / 2);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}