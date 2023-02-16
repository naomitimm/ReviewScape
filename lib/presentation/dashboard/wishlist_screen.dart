import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class WishlistScreen extends StatelessWidget {
  final User user;
  const WishlistScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navCubit = context.read<NavigationCubit>();
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color.fromRGBO(255, 114, 76, 1),
              ));
            }

            if (state is WishlistLoadingSuccessful && state.products.isEmpty) {
              return NoProducts(
                dispatcher: () {
                  navCubit.toDashboardScreen(
                      User(email: "", fullName: "", userName: ""));
                },
              );
            }

            if (state is WishlistLoadingSuccessful) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView(children: [
                  const PageHeadline(
                    color: Color.fromRGBO(42, 44, 65, 1),
                    text: 'Wishlist',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: size.height / 1.33,
                      child: ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: ((context, index) {
                            return CartProductCard(
                              product: state.products[index],
                              dispatcher: () {
                                navCubit.toProductDetailsScreen(
                                    state.products[index], user);
                              },
                              remover: () {
                                context.read<WishlistBloc>().add(
                                    RemoveFromWishlist(
                                        product: state.products[index]));
                              },
                            );
                          })),
                    ),
                  )
                ]),
              );
            }

            if (state is WishlistLoadingFailed) {
              return Center(
                child: Text(state.error.toString()),
              );
            }

            return Container();
          },
        ));
  }
}
