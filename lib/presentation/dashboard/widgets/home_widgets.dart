import 'package:ethio_agri_ceft_app/presentation/exports.dart';
import 'package:flutter/cupertino.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CupertinoSearchTextField(
        itemColor: const Color.fromRGBO(255, 114, 76, 1),
        placeholderStyle: const TextStyle(
          color: Color.fromARGB(255, 158, 158, 158),
        ),
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromRGBO(255, 114, 76, 1).withOpacity(0.1),
      ),
    );
  }
}

class TypeCardUnselected extends StatelessWidget {
  final String name;
  final String imageUrl;
  final void Function() dispatcher;
  const TypeCardUnselected(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.dispatcher});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: GestureDetector(
        onTap: dispatcher,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(255, 114, 76, 1), width: .5),
              color: const Color.fromRGBO(244, 244, 248, 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imageUrl)),
                    ),
                  ),
                  Text(name,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(42, 44, 65, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}

class TypeCardSelected extends StatelessWidget {
  final String name;
  final String imageUrl;
  const TypeCardSelected(
      {super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(255, 114, 76, 1), width: .5),
            color: const Color.fromRGBO(255, 114, 76, 1),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imageUrl)),
              ),
            ),
            Text(name,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ))
          ]),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final void Function() dispatcher;
  const ProductCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.dispatcher});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: dispatcher,
        child: Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(42, 44, 65, 1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height / 5.5,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageUrl), fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                    Text("ETB ${price.toString()}",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeSortText extends StatelessWidget {
  const HomeSortText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Popular",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Color.fromRGBO(42, 44, 65, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
          ],
        ),
      ),
    );
  }
}
