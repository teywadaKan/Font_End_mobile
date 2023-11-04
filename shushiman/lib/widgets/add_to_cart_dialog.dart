import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/sushi_model.dart';

class AddToCartDialog extends StatefulWidget {
  final SushiModel sushi;
  const AddToCartDialog({super.key, required this.sushi});

  @override
  State<AddToCartDialog> createState() => _AddToCartDialogState();
}

class _AddToCartDialogState extends State<AddToCartDialog> {
  int amount = 0;

  void plus() {
    setState(() {
      amount++;
    });
  }

  void minus() {
    if (amount > 0) {
      setState(() {
        amount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SushiModel sushi = widget.sushi;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 156, 172, 158)),
        height: 350,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Image.network(
              sushi.image,
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              sushi.name,
              style: GoogleFonts.redHatDisplay(fontSize: 24),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "${sushi.price} Baht",
              style: GoogleFonts.redHatDisplay(fontSize: 20),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF79AC78)),
                  child: IconButton(
                    onPressed: minus,
                    icon: const Icon(Icons.remove),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        amount.toString(),
                        style: GoogleFonts.redHatDisplay(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF79AC78)),
                  child: IconButton(
                    onPressed: plus,
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 146, 198, 121),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add To Cart"),
                        Icon(Icons.shopping_cart_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
