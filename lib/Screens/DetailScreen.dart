// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:homework_flutter_rest_api/Model/DataModel.dart';
import 'package:homework_flutter_rest_api/Constants.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final Movies = ModalRoute.of(context)!.settings.arguments as Result;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.network(
            ApiConstants.getimageEndPoint(Movies.backdropPath),
            height: screenHeight,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25,
              sigmaY: 25,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          ListView(padding: EdgeInsets.zero, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              
              children: [
                Image.network(
                  ApiConstants.getimageEndPoint(Movies.posterPath),
                  fit: BoxFit.fitHeight,
                ),
                
                 const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    Expanded(
                      child: Text(
                        Movies.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                        maxLines: null, 
                      ),
                    )
                  ],
                ),
                 const Padding(padding: EdgeInsets.only(top: 15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Text(
                          Movies.originalLanguage.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            
                          ),
                        ),
                        const Text("Language")
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          Movies.releaseDate.year.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("Release")
                      ],
                    ),
                    Column(
                      children: [
                        Movies.adult
                            ? const Text(
                                "R",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(
                                "PG",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        const Text("Rating")
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            for (var i = 0;
                                i < (Movies.voteAverage.toInt() / 2 );
                                i++)
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                shadows: [Shadow(blurRadius: 2)],
                              ),
                          ],
                        ),
                        const Text("Rating")
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    Movies.overview,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30))
          ]
          
          )
        ],
      ),
    );
  }
}
