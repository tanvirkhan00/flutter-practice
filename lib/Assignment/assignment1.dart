import 'package:flutter/material.dart';


class assignment1 extends StatelessWidget {
  const assignment1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300, // Fixed height for Stack
                  width: double.infinity,
                  child: Image.network(
                    'https://media.istockphoto.com/id/606217830/photo/boat-riding-in-a-river.jpg?s=612x612&w=0&k=20&c=sftvdXliMLSjTiAeBEEr9LonNQpXlHTEx5_aUlbsDOI=',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: 30,
                  child: Text(
                    'Explore the World',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  right: 70, // Ensure width for the TextField
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Your Destination',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white, // Background for readability
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text('Top destinations', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network('https://w0.peakpx.com/wallpaper/137/377/HD-wallpaper-nature-bangladesh-green-lake-peace-sky-water.jpg',
                        fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 10,
                          child: Text('Sky', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          ))
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network('https://live.staticflickr.com/7579/15517592588_3a087f5e1a_b.jpg',
                        fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Text('Kash Full'))
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network('https://d34vm3j4h7f97z.cloudfront.net/original/4X/7/b/5/7b5251b8905330ff52a46030e2630cc5474db7cb.jpeg',
                        fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Text('Sky'))
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network('https://wallup.net/wp-content/uploads/2016/06/23/377712-photography-nature-river-island-boat-morning-sunlight-sky-sand-calm-Bangladesh-landscape.jpg',
                        fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Text('Sky'))
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
