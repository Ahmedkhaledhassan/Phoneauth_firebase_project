import 'package:country_picker/country_picker.dart';
import 'package:firebase_pro/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneContraller = TextEditingController();

  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");
  @override
  Widget build(BuildContext context) {
    phoneContraller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneContraller.text.length,
      ),
    );
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 3),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 219, 165, 226),
                ),
                child: Image.asset("sign2.jpg"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Add your phone number.We'll send you a verification code",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: Color.fromARGB(255, 185, 104, 199),
                controller: phoneContraller,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                onChanged: (value) {
                  setState(() {
                    phoneContraller.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter phone number",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 550),
                            onSelect: ((value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            }));
                      },
                      child: Text(
                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: phoneContraller.text.length > 9
                      ? Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(text: "Login", onPressed: () {}),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
