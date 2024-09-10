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

// Widget
import 'package:queue/widgets/list_queue.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({super.key});

  @override
  State<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  // Controller
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  // Status Widget Loading
  bool isLoading = false;

  @override
  void initState() {
    // Get Data
    Provider.of<QueueProvider>(context, listen: false).allQueue();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Provider
    QueueProvider queueProvider = Provider.of<QueueProvider>(context);

    // Phone Input
    Widget phoneInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TextFormField
          TextFormField(
            controller: _phoneController,
            validator: (value) {
              return validateInputNumber(value, 'phone');
            },
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
              hintText: 'Search Your Phone',
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
                      // queueProvider.addQueue(
                      //     _nameController.text,
                      //     _phoneController.text,
                      //     int.parse(_paxController.text));

                      // nonaktifkan widget loading
                      setState(() {
                        isLoading = false;
                      });

                      print('true');
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
                      'Search',
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
              phoneInput(),
              SizedBox(
                height: 10,
              ),
              buttonSubmit(),
            ],
          ),
        ),
      );
    }

    // LIST QUEUE
    Widget listQueue() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Antrian Pelanggan Lainnya',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 450,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: queueProvider.queues
                      .map((value) => ListQueueWidget(value))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Queue',
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
          listQueue(),
        ],
      ),
    );
  }
}
