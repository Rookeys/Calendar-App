import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/widgets/membersAdminEdit/membersEditForm.dart';
import 'package:flutter/material.dart';

class MembersAdminEdit extends StatelessWidget {
  const MembersAdminEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage('assets/example_profile.jpg'),
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 50),
                const MembersEditForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.label,
    this.width = 300,
  });
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: width,
            child: TextFormField(
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CustomColor.darkGray,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomColor.darkGray,
            ),
          ),
        )
      ],
    );
  }
}

class CustomSecretInput extends StatefulWidget {
  const CustomSecretInput({
    super.key,
    required this.label,
    this.width = 300,
  });
  final String label;
  final double width;

  @override
  State<CustomSecretInput> createState() => _CustomSecretInputState();
}

class _CustomSecretInputState extends State<CustomSecretInput> {
  bool _secret = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: widget.width,
            child: TextFormField(
              obscureText: _secret,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  child: _secret
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                  onTap: () => setState(() {
                    _secret = !_secret;
                  }),
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CustomColor.darkGray,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomColor.darkGray,
            ),
          ),
        )
      ],
    );
  }
}
