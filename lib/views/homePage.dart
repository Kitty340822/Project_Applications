import 'package:flutter/material.dart';
import '../widgets/album_card.dart';
import '../widgets/song_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: BoxDecoration(
              color: Color.fromARGB(240, 2, 173, 136),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recently Played",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Row(
                            children: [
                              Icon(Icons.history),
                              SizedBox(width: 20),
                              Icon(Icons.settings),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          AlbumCard(
                            label: "Best mode",
                            image: AssetImage("assets/album01.jpg"),
                          ),
                          SizedBox(width: 20),
                          AlbumCard(
                            label: "Love <3",
                            image: AssetImage("assets/album02.jpg"),
                          ),
                          SizedBox(width: 20),
                          AlbumCard(
                            label: "Away",
                            image: AssetImage("assets/album03.jpg"),
                          ),
                          SizedBox(width: 20),
                          AlbumCard(
                            label: "Away",
                            image: AssetImage("assets/album04.jpg"),
                          ),
                          SizedBox(width: 20),
                          AlbumCard(
                            label: "Away",
                            image: AssetImage("assets/top_50_Th.jpg"),
                          ),
                          SizedBox(width: 20),
                          AlbumCard(
                            label: "Away",
                            image: AssetImage("assets/top_50_global.jpg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The Most Played",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "The Iron sea",
                                image: AssetImage("assets/album_theironsea.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Ocean",
                                image: AssetImage("assets/album_ocean.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "The Sky",
                                image: AssetImage("assets/album_sky.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Sunset",
                                image: AssetImage("assets/album_sunset.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "BF",
                                image: AssetImage("assets/album_f1.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Feat",
                                image: AssetImage("assets/album_f2.jpg"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Your recent rotation",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                                SongCard(
                                  image: AssetImage("assets/album_f3.jpg"),
                                  label: "BF, 2028, Bboss, Sadsong, ...",
                                ),
                                SizedBox(width: 16),
                                SongCard(
                                  image: AssetImage("assets/album_ocean.jpg"),
                                  label: "Ocean, 2019, MMax, Moodsong, ...",
                                ),
                                SizedBox(width: 16),
                                SongCard(
                                  image: AssetImage("assets/album_sky.jpg"),
                                  label: "Sky, 2028, Bboss Kusisu, Sadsong, ...",
                                ),
                                SizedBox(width: 16),
                                SongCard(
                                  image: AssetImage("assets/album_sea.jpg"),
                                  label: "The Sea, 2029, GFuck T., Funnysong, ...",
                                ),
                                SizedBox(width: 16),
                                SongCard(
                                  image: AssetImage("assets/album_youandmewithsky.jpg"),
                                  label: "You and Me with sky, 2002, tyooiop l., Sadsong, ...",
                                ),
                                SizedBox(width: 16),
                                SongCard(
                                  image: AssetImage("assets/album_heartclouds.jpg"),
                                  label: "Heart and Clouds, 2025, Stusuy Y., Moodsong, ...",
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    super.key,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Image(
            image: image,
            height: 48,
            width: 48,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Text(label),
        ],
      ),
    );
  }
}
