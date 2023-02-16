import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class SortedProductsScreen extends StatelessWidget {
  final ProductType productType;
  final User user;
  const SortedProductsScreen(
      {super.key, required this.productType, required this.user});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            height: size.height / 10,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(42, 44, 65, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackBtnEmbedded(dispatcher: () {
                    navCubit.toDashboardScreen(
                        const User(email: "", fullName: "", userName: ""));
                  }),
                  SortedHeadline(title: productType.productTypeName),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sort,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              height: size.height / 1.25,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: (3 / 4)),
                  itemCount: productType.products.length,
                  itemBuilder: ((context, index) {
                    return ProductCard(
                      price: productType.products[index].price!,
                      imageUrl: productType.products[index].imageUrl,
                      name: productType.products[index].productName,
                      dispatcher: () {
                        navCubit.toProductDetailsScreen(
                            productType.products[index], user);
                      },
                    );
                  })),
            ),
          )
        ],
      )),
    );
  }
}
