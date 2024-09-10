import 'package:flutter/material.dart';

// Packages
import 'package:google_fonts/google_fonts.dart';

// Provider
import 'package:provider/provider.dart';

// Class Provider
import 'package:queue/providers/queue_provider.dart';

// Theme
import 'package:queue/theme.dart';

// Validator
import 'package:queue/validators.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // Controller
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _paxController = TextEditingController();

  // Status Widget Loading
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Provider
    QueueProvider queueProvider = Provider.of<QueueProvider>(context);

    // Name Input
    Widget nameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text
          Text(
            'Name',
            style: blackTextStyle,
          ),

          SizedBox(
            height: 5,
          ),

          // TextFormField
          TextFormField(
            controller: _nameController,
            validator: (value) {
              return validateInput(value, 'name');
            },
            // validasi ketika apa (contoh ketika diketik atau selalu)
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteGreyColor,
              // content padding digunakan ukuran pada konten input
              contentPadding: const EdgeInsets.only(
                right: 15,
                bottom: 15,
                top: 15,
              ),

              // Prefix digunakan sebagai jika ada widget optional, saat ini digunakan untuk padding content
              prefix: SizedBox(
                width: 15,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.green),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.red),
              ),
              errorStyle: GoogleFonts.nunito(
                fontSize: 12,
                color: Color(0xffFF314A),
              ),
              hintText: 'Input Your Name',
              hintStyle: GoogleFonts.nunito(
                fontSize: 14,
                color: Color(0xffA9A9A9),
              ),
            ),
          ),
        ],
      );
    }

    // Phone Input
    Widget phoneInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text
          Text(
            'Phone',
            style: blackTextStyle,
          ),

          SizedBox(
            height: 5,
          ),

          // TextFormField
          TextFormField(
            controller: _phoneController,
            // validasi ketika apa (contoh ketika diketik atau selalu)
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteGreyColor,
              // content padding digunakan ukuran pada konten input
              contentPadding: const EdgeInsets.only(
                right: 15,
                bottom: 15,
                top: 15,
              ),

              // Prefix digunakan sebagai jika ada widget optional, saat ini digunakan untuk padding content
              prefix: SizedBox(
                width: 15,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.green),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.red),
              ),
              errorStyle: GoogleFonts.nunito(
                fontSize: 12,
                color: Color(0xffFF314A),
              ),
              hintText: 'Input Your Phone',
              hintStyle: GoogleFonts.nunito(
                fontSize: 14,
                color: Color(0xffA9A9A9),
              ),
            ),
          ),
        ],
      );
    }

    // Customer Pax Input
    Widget paxInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text
          Text(
            'Customer Pax',
            style: blackTextStyle,
          ),

          SizedBox(
            height: 5,
          ),

          // TextFormField
          TextFormField(
            controller: _paxController,
            // validasi ketika apa (contoh ketika diketik atau selalu)
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateInputNumber(value, 'customer pax');
            },
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteGreyColor,
              // content padding digunakan ukuran pada konten input
              contentPadding: const EdgeInsets.only(
                right: 15,
                bottom: 15,
                top: 15,
              ),

              // Prefix digunakan sebagai jika ada widget optional, saat ini digunakan untuk padding content
              prefix: SizedBox(
                width: 15,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.green),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.red),
              ),
              errorStyle: GoogleFonts.nunito(
                fontSize: 12,
                color: Color(0xffFF314A),
              ),
              hintText: 'Input Your Customer Pax',
              hintStyle: GoogleFonts.nunito(
                fontSize: 14,
                color: Color(0xffA9A9A9),
              ),
            ),
          ),
        ],
      );
    }

    // Submit Button
    Widget buttonSubmit() {
      return Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // aktifkan widget loading
                  setState(() {
                    isLoading = true;
                  });

                  Future.delayed(
                    Duration(seconds: 2),
                    () {
                      // Add Provider
                      queueProvider.addQueue(
                          _nameController.text,
                          _phoneController.text,
                          int.parse(_paxController.text));

                      // nonaktifkan widget loading
                      setState(() {
                        isLoading = false;
                      });

                      // Route ke halaman queue (Antrian)
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/queue',
                        (route) => false,
                      );
                    },
                  );
                } else {
                  print('false');
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: whiteColor,
                      backgroundColor: whiteGreyColor,
                      strokeWidth: 3,
                    )
                  : Text(
                      'Add Queue',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
            ),
          )
        ],
      );
    }

    // Form Input
    Widget input() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              nameInput(),
              SizedBox(
                height: 10,
              ),
              phoneInput(),
              SizedBox(
                height: 10,
              ),
              paxInput(),
              SizedBox(
                height: 30,
              ),
              buttonSubmit(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Add Queue',
          style: greenTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          input(),
        ],
      ),
    );
  }
}
