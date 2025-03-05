import 'package:flutter/material.dart';

class GenderFormField extends FormField<String> {
  GenderFormField({
    super.key,
    String initialValue = "",
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
  }) : super(
            initialValue: initialValue,
            onSaved: onSaved,
            validator: validator,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<String> state) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Female'),
                          leading: Radio(
                            value: 'Female',
                            groupValue: state.value,
                            onChanged: (value) {
                              state.didChange(value);
                            },
                          ),
                        )),
                        Expanded(
                            child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Male'),
                          leading: Radio(
                            value: 'Male',
                            groupValue: state.value,
                            onChanged: (value) {
                              state.didChange(value);
                            },
                          ),
                        )),
                        Expanded(
                            child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Other'),
                          leading: Radio(
                            value: 'Other',
                            groupValue: state.value,
                            onChanged: (value) {
                              state.didChange(value);
                            },
                          ),
                        ))
                      ],
                    ),
                    state.hasError
                        ? Text(state.errorText!,
                            style: const TextStyle(color: Colors.red))
                        : Container(),
                  ],
                ),
              );
            });
  @override
  GenderFormFieldState createState() => GenderFormFieldState();
}

class GenderFormFieldState extends FormFieldState<String> {
  @override
  GenderFormField get widget => super.widget as GenderFormField;
}
