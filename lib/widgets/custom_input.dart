import 'package:craftmani/exports.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {

  final bool isPassword;
  final String labelText;
  final IconData icon;
  final TextInputAction inputAction;
  final TextEditingController inputController;
  final TextInputType inputType;
  final String inputError;

  const CustomInput({Key? key,
    this.isPassword=false,
    required this.labelText,
    this.icon = Icons.abc,
    required this.inputAction,
    required this.inputController, required this.inputType,
    this.inputError=""
  }) : super(key: key);


  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {

  clearError(){
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 17),
          padding: const EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 10),
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ThemeColor.black.withOpacity(.5),
                width: 0.5
            )
          ),
          child: TextField(
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
            controller: widget.inputController,
            autocorrect: false,
            cursorColor: ThemeColor.black.withOpacity(0.3),
            decoration: InputDecoration(
              border: InputBorder.none,
              errorText: widget.inputError,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              errorStyle: const TextStyle(
                color: ThemeColor.red,
                fontSize: 10
              )
            ),
            style: const TextStyle(
                fontSize: 11,
                fontFamily: "Poppins"
            ),
            obscureText: widget.isPassword,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(7),
          margin: const EdgeInsets.only(left: 30),
          color: ThemeColor.white,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              Icon(
                widget.icon,
                size: 15,
              ),
              const SizedBox(width: 5),
              Text(widget.labelText,
                style: const TextStyle(
                  fontSize: 12
                ),
              ),
            ],
          ),
        ),
        /*Container(
          color: ThemeColor.white,
          padding: EdgeInsets.only(top: 9, bottom: 8, left: 7, right: 3),
          margin: EdgeInsets.only(left: 15),
          child: Icon(
            widget.icon,
            size: 15,
          ),
        )*/
      ],
    );
  }

}
