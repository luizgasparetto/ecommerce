import 'package:ecommerce/app/presentation/ui/widgets/custom_text_field_basic.dart';
import 'package:ecommerce/core/exports/exports.dart';

class CustomResetPasswordBottomSheet extends StatefulWidget {
  const CustomResetPasswordBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomResetPasswordBottomSheet> createState() =>
      _CustomResetPasswordBottomSheetState();
}

class _CustomResetPasswordBottomSheetState
    extends State<CustomResetPasswordBottomSheet> {
  final authBloc = GetIt.I.get<AuthBloc>();

  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Text(
            'Reset your password',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColorDark,
              fontSize: MediaQuery.of(context).textScaleFactor * 28,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomTextFieldBasic(
              hintText: 'E-mail',
              icon: MaterialCommunityIcons.at,
              controller: _controller,
              onChangedFunction: (value) {
                setState(() {
                  _controller.text = value;
                });
              }),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'We will send you an email so you can successfully\nreset your password',
            style: TextStyle(
              color: Theme.of(context).dialogBackgroundColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          CustomElevatedButton(
            buttonTitle: 'Send e-mail',
            paddingValue: 16,
            onPressedFunction: () {
              if (_controller.text.isNotEmpty) {
                authBloc.add(ResetPasswordEvent(_controller.text));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('E-mail sent successfully'),
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
