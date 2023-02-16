import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navCubit = context.read<NavigationCubit>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            const PageHeadline(
              color: Color.fromRGBO(42, 44, 65, 1),
              text: 'Home',
            ),
            const MySearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ProductType.productTypes.length,
                    itemBuilder: ((context, index) {
                      return TypeCardUnselected(
                        name: ProductType.productTypes[index].productTypeName,
                        imageUrl: ProductType.productTypes[index].imageUrl,
                        dispatcher: () {
                          navCubit.toSortedProductsScreen(
                              ProductType.productTypes[index], user);
                        },
                      );
                    })),
              ),
            ),
            const HomeSortText(),
            SizedBox(
              height: size.height / 1.8,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: (3 / 4)),
                  itemCount: Product.popularProducts.length,
                  itemBuilder: ((context, index) {
                    return ProductCard(
                      price: Product.popularProducts[index].price!,
                      imageUrl: Product.popularProducts[index].imageUrl,
                      name: Product.popularProducts[index].productName,
                      dispatcher: () {
                        navCubit.toProductDetailsScreen(
                            Product.popularProducts[index], user);
                      },
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
