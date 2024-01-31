import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/dashboard/widgets/details_widgets.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final User user;
  const ProductDetailsScreen(
      {Key? key, required this.product, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navCubit = context.read<NavigationCubit>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
      body: SafeArea(
          child: ListView(children: [
        Stack(
          children: [
            SizedBox(
              height: size.height / 2,
            ),
            Container(
              height: size.height / 2.2,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(product.imageUrl), fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: size.height / 2.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  ),
                  Positioned(
                      top: size.height / 90,
                      left: size.width / 90,
                      child: BackBtnEmbedded(
                        dispatcher: () {
                          navCubit.toDashboardScreen(const User(
                              email: "", fullName: "", userName: ""));
                        },
                      )),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: StatisticsCard(
                    title: product.productName,
                    price: product.price.toString(),
                    rating: product.rating,
                  )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DetailsProductHeadline2(title: "Description"),
              const DetailsSmallText(
                  text:
                      "A renowned and trusted name in the world of tea, brings you a delightful experience with its exceptional tea blends. Known for its commitment to quality and innovation, Lipton offers a diverse range of teas crafted to suit every taste preference."),
              Text(
                product.description,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const DetailsProductHeadline2(title: "Ingridients"),
              const DetailsSmallText(
                  text:
                      "Eight catechins\nCaffeine\nTheaflavine\nGallic acid\nChlorogenic acid"),
              Center(
                  child: BlocConsumer<WishlistBloc, WishlistState>(
                listener: (context, state) {
                  if (state is WishlistLoadingSuccessful) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: const Color.fromRGBO(255, 114, 76, 1)
                              .withOpacity(0.5),
                          content: const Text("Added to wishlist")),
                    );
                  }
                },
                builder: (context, state) {
                  return DetailsCalltoActionCard(
                    dispatcher: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddToWishlist(product: product));
                    },
                    reviewDispatcher: () {
                      navCubit.toReviewsScreen(product, user);
                    },
                  );
                },
              ))
            ],
          ),
        ),
      ])),
    );
  }
}
