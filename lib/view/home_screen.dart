import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/music_provider.dart';

Music prof = Music();
Music prot = Music();

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    prof = Provider.of<Music>(context, listen: false);
    prot = Provider.of<Music>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text("Seach", style: TextStyle(color: Colors.white)),
              prefixIcon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return topView(index);
                },
                itemCount: prof.Musicposter.length,
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "90,s Music",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 162,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      prot.choiceIndex = index;
                      Navigator.pushNamed(context, 'view',arguments: index);
                    },
                      child: playlist1(index));
                },
                itemCount: prot.baner90.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Bollywood",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 162,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, 'view',arguments: index);
                    },
                      child: palylist2(index));
                },
                itemCount: prot.baneer20.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Top 5",
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 162,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, 'view',arguments: index);
                      },
                      child: lastview (index));
                },
                itemCount: prot.top5.length,
              ),
            ),

          ],
        ),
      ),
    ));
  }

  Widget topView(int index) {
    return Container(
      height: 160,
      width: 231,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "${prof!.Musicposter[index]}",
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
  Widget playlist1(int index)
  {
    return Container(
      height: 150,
      width: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "${prot.baner90[index]}",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget palylist2(int index)
  {
    return Container(
      height: 150,
      width: 200,
      margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "${prot.baneer20[index]}",
            fit: BoxFit.cover,
          ),
        ),
    );
  }
  Widget lastview(int index) {
    return Container(
      height: 160,
      width: 231,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "${prof!.top5[index]}",
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

}
