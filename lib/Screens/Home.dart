// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homework_flutter_rest_api/Constants.dart';
import 'package:homework_flutter_rest_api/Model/DataModel.dart';
import 'package:homework_flutter_rest_api/Screens/DetailScreen.dart';
import 'package:homework_flutter_rest_api/Services/api_Services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 1;
  List<MoviesModel>? MoviesDataArray;

  @override
  void initState() {
    super.initState();
    MoviesDataArray = [];
    getMoviesData();
  }
void getMoviesData() async {
    var MoviesData = await ApiService().getMovies(page);
    print("GetMovies Called");
    setState(() {
      if (MoviesData != null) {
        MoviesDataArray = [MoviesData];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        title:  const Text("Movies DB"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(children: [
        Image.network(
              ApiConstants.getimageEndPoint(MoviesDataArray![0].results[0].backdropPath),
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
        MoviesDataArray == null || MoviesDataArray!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
            
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 120,left: 5,right: 5,bottom: 20),
                itemCount: MoviesDataArray![0].results.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                          ApiConstants.getimageEndPoint(
                              MoviesDataArray![0].results[index].posterPath),
                        ),
                        title:
                            Text(MoviesDataArray![0].results[index].title),
                        trailing: 
                            const Icon(Icons.chevron_right,),
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailPage(),
                              settings: RouteSettings(
                                  arguments:
                                      MoviesDataArray![0].results[index]),
                            ),
                          ),
                        },
                      ),
                      const Divider(),
                    ],
                  );
                },
                
              ),
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                getMoviesData();
              },
            ),
          
    
      ],)
      
    );
  }
}
