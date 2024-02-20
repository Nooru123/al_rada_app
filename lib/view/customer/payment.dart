import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:upi_india/upi_response.dart';

import '../../controller/login.dart';
import 'card.dart';
class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {

    final payment = Provider.of<PaymentPro>(context, listen: false);


    return Scaffold(

      appBar:AppBar(
        backgroundColor: const Color.fromRGBO(111, 31, 40, 1),

        title: Text("Payment",style: TextStyle(color: Colors.white),),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const CardPage()));
        },),
      ) ,
      body:  Column(
        children: <Widget>[
          Expanded(
            child: payment.displayUpiApps(),
          ),
          Expanded(
            child: FutureBuilder(
              future:payment. transaction,
              builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        payment.upiErrorHandler(snapshot.error.runtimeType),
                        style: GoogleFonts.poppins(),
                      ), // Print's text message on screen
                    );
                  }

                  // If we have data then definitely we will have UpiResponse.
                  // It cannot be null
                  UpiResponse _upiResponse = snapshot.data!;

                  // Data in UpiResponse can be null. Check before printing
                  String txnId = _upiResponse.transactionId ?? 'N/A';
                  String resCode = _upiResponse.responseCode ?? 'N/A';
                  String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                  String status = _upiResponse.status ?? 'N/A';
                  String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                  payment. checkTxnStatus(status);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        payment.displayTransactionData('Transaction Id', txnId),
                        payment.displayTransactionData('Response Code', resCode),
                        payment.displayTransactionData('Reference Id', txnRef),
                        payment. displayTransactionData('Status', status.toUpperCase()),
                        payment.displayTransactionData('Approval No', approvalRef),
                      ],
                    ),
                  );
                } else
                  return Center(
                    child: Text(''),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}