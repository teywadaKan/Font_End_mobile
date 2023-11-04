import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shushiman/model/sushi_model.dart';
import 'package:shushiman/page/cart_screen.dart';
import 'package:shushiman/service/sushi_api.dart';
import 'package:shushiman/widgets/add_to_cart_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<SushiModel>> sushies;

  Future<List<SushiModel>> getDataSushi() async {
    List<SushiModel> sushiData = await SushiApi.getData();
    return sushiData;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      sushies = getDataSushi();
    });
  }

  // ignore: non_constant_identifier_names
  Widget SushiTile(screenSize) {
    return FutureBuilder<List<SushiModel>>(
      future: sushies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LinearProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<SushiModel> sushi = snapshot.data!;
            return SizedBox(
              height: (screenSize.height) - 90,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: sushi.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AddToCartDialog(sushi: sushi[index]);
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 199, 217, 204),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 35,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  sushi[index].image,
                                  fit: BoxFit.cover,
                                  width: 80,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sushi[index].name,
                                      style: GoogleFonts.redHatDisplay(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "${sushi[index].price} Baht.",
                                      style: GoogleFonts.redHatDisplay(
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
              ),
            );
          } else {
            return const LinearProgressIndicator();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.grey[100]),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Zuzhi",
          style: GoogleFonts.redHatDisplay(fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 156, 172, 158),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SushiTile(screenSize),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 114, 154, 120),
        tooltip: 'Increment',
        onPressed: () {
          Get.to(const CartScreen());
        },
        child: const Icon(Icons.shopping_cart_rounded, size: 28),
      ),
    );
  }
}
