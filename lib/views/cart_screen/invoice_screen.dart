import 'package:emart_app/api/api_services.dart';
import 'package:emart_app/views/cart_screen/invoice_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk formatting tanggal
import 'package:emart_app/model/mdlNota.dart'; // Sesuaikan dengan lokasi model Anda

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  getNota? _invoiceData;

  @override
  void initState() {
    super.initState();
    fetchInvoiceData();
  }

  Future<String?> getToken() async {
    return await UserService
        .getToken(); // Mendapatkan token dari shared preferences
  }

  void fetchInvoiceData() async {
    String? userId = await UserService.getUserId();
    String? token = await UserService.getToken(); // Ambil token pengguna
    if (userId != null && token != null) {
      InvoiceController()
          .getInvoice(int.parse(userId), token)
          .then((invoiceData) {
        if (invoiceData != null) {
          setState(() {
            _invoiceData = invoiceData;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Gagal mendapatkan data invoice'),
          ));
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Pengguna tidak login'),
      ));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
      ),
      backgroundColor:
          Colors.grey[200], // Ubah warna latar belakang body di sini
      body: _invoiceData != null
          ? ListView.builder(
              itemCount: _invoiceData!.data!.length,
              itemBuilder: (context, index) {
                var invoice = _invoiceData!.data![index];
                return Card(
                    elevation: 3,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors
                        .orange, // Tambahkan warna latar belakang card di sini
                    child: ListTile(
                      title: Text('Invoice #${invoice.id}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total: ${invoice.total}'),
                          Text('Alamat: ${invoice.alamat}'),
                          Text('Pengiriman: ${invoice.pengiriman}'),
                          Text(
                            'Tanggal: ${DateFormat('dd MMM yyyy').format(
                              DateTime.parse(invoice.createdAt!),
                            )}',
                          ),
                        ],
                      ),
                      onTap: () {
                        // Implementasi penanganan ketika item invoice diklik
                      },
                    ));
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
