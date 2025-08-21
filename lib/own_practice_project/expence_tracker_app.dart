import 'package:flutter/material.dart';

class ExpenseTrackerApp extends StatefulWidget {
  const ExpenseTrackerApp({super.key});

  @override
  State<ExpenseTrackerApp> createState() => _ExpenseTrackerAppState();
}

class _ExpenseTrackerAppState extends State<ExpenseTrackerApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> transactions =[]; //Store transactions data

  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  String _selectedType = "Expense";

  void _addTransactions() {
    if(_titleController.text.isEmpty || _amountController.text.isEmpty) return ;

    setState(() {
      transactions.add({
        "title": _titleController.text,
        "amount" : double.tryParse(_amountController.text) ?? 0.00,
        "type": _selectedType
      });

      //Clear filed after adding
      _titleController.clear();
      _amountController.clear();
    });
  }

  //Calculate balance
  double get balance {
    double income= 0, expense= 0;
    for (var t in transactions) {
      if (t["type"] == "Income") {
        income += t["amount"] ;
      } else {
        expense += t["amount"];
      }
    }
    return income- expense;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController= TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker App'),
        bottom: TabBar(
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
          unselectedLabelColor: Colors.white,
          controller: _tabController,
          tabs: [
          Tab(text: 'Add Transaction',),
          Tab(text: 'Transaction List',)
        ],),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Form(
              child:Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 10,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),

                    ),
                    TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Amount'
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton <String>(
                        value: _selectedType,
                        items: ["Expense", "Income"].map((String value){
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val){
                          setState(() {
                            _selectedType =val! ;
                          });
                        }),
                    ElevatedButton(onPressed: _addTransactions,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Add Transactions'))
                  ],
                ),
              )
          ),
          Column(
            children: [
              Text("Balance: \$${balance.toStringAsFixed(2)}", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
              Expanded(
                child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index){
                      final t = transactions[index];
                      return ListTile(
                        title: Text(t['title']),
                        subtitle: Text("\$${t["amount"].toStringAsFixed(2)}"),
                        trailing: Text(t["type"], style: TextStyle(
                          color: t["type"]=="Income" ? Colors.green : Colors.red
                        ),),
                      );
                    }),
              )
            ],
          )
        ],
      )
    );
  }
}
