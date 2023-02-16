import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class CartProductCard extends StatelessWidget {
  final void Function() dispatcher;
  final void Function() remover;
  final Product product;
  const CartProductCard(
      {super.key,
      required this.dispatcher,
      required this.remover,
      required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: size.height / 6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width / 2.5,
              height: size.height / 6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(product.imageUrl), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(product.productName,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                Text("${product.price}  ETB",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            GestureDetector(
              onTap: remover,
              child: Container(
                height: size.height,
                width: 35,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 114, 76, 1),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: const Center(
                    child: FaIcon(
                  FontAwesomeIcons.trash,
                  size: 20,
                  color: Colors.white,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WishlistBrowseBtn extends StatelessWidget {
  final void Function() dispatcher;
  final String text;
  const WishlistBrowseBtn(
      {Key? key, required this.dispatcher, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: dispatcher,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(42, 44, 65, 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search,
              color: Color.fromRGBO(255, 114, 76, 1),
              size: 27,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Color.fromRGBO(255, 114, 76, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
          ],
        ),
      ),
    );
  }
}

class NoProducts extends StatelessWidget {
  final void Function() dispatcher;
  const NoProducts({super.key, required this.dispatcher});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const PageHeadline(
              color: Color.fromRGBO(42, 44, 65, 1),
              text: 'Wishlist',
            ),
            Center(
              child: Container(
                  height: size.height / 2,
                  width: size.width / 2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/empty_cart.png'),
                          fit: BoxFit.contain))),
            ),
            Center(
              child: Text(
                  textAlign: TextAlign.center,
                  "Your wishlist is empty.\nBrowse ReviewScape to find products you like.",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Color.fromRGBO(42, 44, 65, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            SizedBox(
              height: size.height / 12,
            ),
            WishlistBrowseBtn(
                dispatcher: dispatcher, text: "Browse ReviewScape")
          ]),
        )));
  }
}
