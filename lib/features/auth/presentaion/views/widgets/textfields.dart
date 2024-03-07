import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.validator,
    this.onchanged,
  });
  final String? Function(String?)? validator;
  final Function(String?)? onchanged;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final ValueNotifier<bool> _isPasswordInVisible = ValueNotifier<bool>(true);
//  ValueNotifier notifies its listeners whenever its value changes.instead of setstate rebuild the whole ui
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isPasswordInVisible,
      builder: (context, isPasswordInVisible, _) {
        return TextFormField(
          validator: widget.validator,
          onChanged: widget.onchanged,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          obscureText: isPasswordInVisible,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            fillColor: const Color(0xFF8B8060).withOpacity(.1),
            hintText: "Password",
            prefixIcon: const Icon(IconlyLight.lock, size: 20),
            suffixIcon: GestureDetector(
              onTap: () {
                _isPasswordInVisible.value = !isPasswordInVisible;
                // _isPasswordVisible.value gets the current value of the ValueNotifier, true
              },
              child: Icon(
                  isPasswordInVisible ? IconlyLight.hide : IconlyLight.show,
                  size: 20),
            ),
            // IconlyLight.hide
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _isPasswordInVisible.dispose();
    super.dispose();
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    this.validator,
    this.onchanged,
  });
  final String? Function(String?)? validator;
  final Function(String?)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator, onChanged: onchanged,
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      // cursorColor: isDark ? Colors.grey : Colors.black54,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: const Color(0xFF8B8060).withOpacity(.1),
        hintText: "Email",
        prefixIcon: const Icon(IconlyLight.message, size: 20),
        // prefixIconColor: isDark ? Colors.white : Colors.black87,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm({super.key, this.valdiator, this.onchanged});
  final String? Function(String?)? valdiator;
  final Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valdiator,
      onChanged: onchanged,
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      cursorColor: Colors.black54,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: const Color(0xFF8B8060).withOpacity(.1),
        hintText: "Email",
        prefixIcon: const Icon(IconlyLight.message, size: 20),
        prefixIconColor: Colors.black87,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class EditTextForm extends StatelessWidget {
  const EditTextForm(
      {super.key,
      this.validator,
      this.onSaved,
      this.initialValue,
      this.hintText,
      required this.icon});
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final String? hintText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      onSaved: onSaved,
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      cursorColor: Colors.black54,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: const Color(0xFF8B8060).withOpacity(.1),
        hintText: hintText,
        prefixIcon: Icon(icon, size: 20),
        prefixIconColor: Colors.black87,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
