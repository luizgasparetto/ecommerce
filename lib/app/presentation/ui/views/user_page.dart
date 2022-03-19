import 'package:ecommerce/core/exports/exports.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final authBloc = context.read<AuthBloc>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AuthGetUserState) {
                final user = state.user;
                return Padding(
                  padding: EdgeInsets.only(top: height * 0),
                  child: Column(
                    children: [
                      CustomUserTile(
                        mainIcon: IconlyBold.profile,
                        title: user.name,
                        subtitle: user.email,
                        mainIconSize: 0.07,
                        leftPadding: 0.01,
                        trailingIcon: IconlyBold.setting,
                      ),
                      SizedBox(height: height * 0.04),
                      const CustomUserTile(
                        mainIcon: MaterialCommunityIcons.basket,
                        title: "All your orders",
                        subtitle: "Check them right out anytime",
                        trailingIcon: MaterialCommunityIcons.arrow_right,
                      ),
                      SizedBox(height: height * 0.015),
                      const CustomUserTile(
                        mainIcon: Icons.star,
                        title: "All your reviews",
                        subtitle: "Check them right out anytime",
                        trailingIcon: MaterialCommunityIcons.arrow_right,
                      ),
                      SizedBox(height: height * 0.04),
                      const CustomUserTile(
                        mainIcon: MaterialCommunityIcons.map_marker,
                        title: 'Delivery Address',
                        trailingIcon: MaterialCommunityIcons.arrow_right,
                      ),
                      SizedBox(height: height * 0.015),
                      CustomUserTile(
                        mainIcon: MaterialCommunityIcons.credit_card,
                        title: 'Credit Cards',
                        trailingIcon: MaterialCommunityIcons.arrow_right,
                        onPressedFuntion: () {
                          Navigator.pushNamed(context, '/credit_cards');
                        },
                      ),
                      SizedBox(height: height * 0.08),
                      CustomElevatedButton(
                        buttonTitle: 'Logout',
                        paddingValue: 16,
                        width: double.infinity,
                        onPressedFunction: () {
                          authBloc.add(LogoutEvent());
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
