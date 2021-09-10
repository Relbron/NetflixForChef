import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:untitled1/Model/movie_model.dart';
late double mqHeight;
late double mqWidth;


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mqHeight= MediaQuery.of(context).size.height;
    mqWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.png"),
          )
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  CurrentUser(),
                  MyTextField(),

                ],
              ),
              ),

              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      leading: Text("Popular",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16.0

                        ),

                      ),
                    ),
                    CarouselSlider(

                        options: CarouselOptions(
                          viewportFraction: 0.4,
                          height: mqHeight*0.3,
                          initialPage: 0,
                          scrollDirection: Axis.horizontal,
                          scrollPhysics: ScrollPhysics(
                            parent: BouncingScrollPhysics(),

                          ),
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,


                        ),
                      items: moviesList.map((e) => GestureDetector(
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(e.image)
                                )
                              ),
                            )

                          ],
                        ),
                      ),
                      ).toList(),

                    )
                    
                  ],
                ),
              ),

            ],
          ),
        )
      )
    );
  }
}
class CurrentUser extends StatelessWidget {
  const CurrentUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hola! ${currentUser[0].name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,

                  ),

              ),
              SizedBox(
                height: 20,
              ),
              Text("Buscar que hay de nuevo.",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24,
                  color: Colors.white,

                ),

              ),
            ],

          ),
          CircleAvatar(
            backgroundColor: Color(0xffD3D6DA),
            backgroundImage: AssetImage(currentUser[0].image),
          )
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mqHeight*0.1-20,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.1),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: TextField(
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),

              ),
              hintText: "Buscar Peliculas",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff969696)
              )


            ),
          ),
        ),
      ),
    );
  }
}




