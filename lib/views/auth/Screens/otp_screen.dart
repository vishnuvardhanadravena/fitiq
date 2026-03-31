import 'package:fitiq/core/theame/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FitiqOtpInput extends StatefulWidget {
  final int length;
  final void Function(String pin)? onCompleted;
  final void Function(String value)? onChanged;

  const FitiqOtpInput({
    super.key,
    this.length = 6,
    this.onCompleted,
    this.onChanged,
  });

  @override
  State<FitiqOtpInput> createState() => _FitiqOtpInputState();
}

class _FitiqOtpInputState extends State<FitiqOtpInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String val, int idx) {
    if (val.isNotEmpty && idx < widget.length - 1) {
      _focusNodes[idx + 1].requestFocus();
    }
    final pin = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(pin);
    if (pin.length == widget.length) widget.onCompleted?.call(pin);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (i) {
        return SizedBox(
          width: 46,
          height: 52,
          child: TextField(
            controller: _controllers[i],
            focusNode: _focusNodes[i],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (v) => _onChanged(v, i),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: AppColors.inputFill,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: AppColors.inputBorder, width: 2),
              ),
            ),
          ),
        );
      }),
    );
  }
}
