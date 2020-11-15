import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTr;
  TransactionList(this.transactions, this.deleteTr);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(),
                Container(
                    height: 300,
                    child: Image.asset(
                      'assets/EmptyState.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 0,
                  color: Colors.lightBlue[700],
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.lightBlue[900],
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: FittedBox(
                            child: Text(
                              '\$${transactions[index].amount}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: Icon(Icons.delete),
                      onLongPress: () => deleteTr(transactions[index].id)),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
