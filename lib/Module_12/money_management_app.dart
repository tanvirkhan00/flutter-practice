import 'package:flutter/material.dart';

class MoneyManagementApp extends StatefulWidget {
  const MoneyManagementApp({super.key});

  @override
  State<MoneyManagementApp> createState() => _MoneyManagementAppState();
}

class _MoneyManagementAppState extends State<MoneyManagementApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String,dynamic>> _earning =[];
  List<Map<String,dynamic>> _expense =[];

  double get totalExpense => _expense.fold(0, (sum, item) => sum+item['amount']);
  double get totalEarning => _earning.fold(0, (sum, item) => sum+item['amount']);
  double get balance => totalEarning - totalExpense ;

  void _addEntry(String title, double amount, DateTime date, bool isEarning){
    setState(() {
      if(isEarning) {
        _earning.add({'title' : title,
        'amount': amount,
          'date': date
        });
      } else {
        _expense.add({'title' : title,
          'amount': amount,
          'date': date
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _showFButtonA(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
              _showForm(isEarning: true);
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: Text('Add Earning', style: TextStyle(
                  color: Colors.white
                ),)),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
              _showForm(isEarning: false);
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                child: Text('Add Expense', style: TextStyle(
                  color: Colors.white
                ),)),
          ],
        ),
      );
    });
  }

  void _showForm ({required bool isEarning}){
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    DateTime entryDate =DateTime.now();
    showModalBottomSheet(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              isEarning ? 'Add Earning' : 'Add Expense', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                if(titleController.text.isNotEmpty && amountController.text.isNotEmpty) {
                 _addEntry(titleController.text, double.parse(amountController.text), entryDate, isEarning);
                 Navigator.pop(context);
                }
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEarning ? Colors.green : Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  child: Text(isEarning ? 'Add Earning' : 'Add Expense', style: TextStyle(
                    fontSize: 18
                  ),)),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Management', style: TextStyle(
          color: Colors.white
        ),),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(text: 'Earning', icon:Icon(Icons.arrow_upward),),
            Tab(text: 'Expend', icon:Icon(Icons.arrow_downward),)
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              _summarycard(title: 'Earning', color: Colors.green, value: totalEarning),
              _summarycard(title: 'Expense', color: Colors.red, value: totalExpense),
              _summarycard(title: 'Balance', color: Colors.blue, value: balance),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
                children: [
              _buildList(_earning, Colors.green, true),
              _buildList(_expense, Colors.red, false),
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _showFButtonA(context),
      child: Icon(Icons.add),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
      ),
    );
  }
}

Widget _summarycard ({required String title,required double value,required Color color}) {
  return Expanded(
    child: Card(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(title, style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600
            ),),
            Text(value.toString(), style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),)
          ],
        ),
      ),
    ),
  );
}

Widget _buildList (List<Map<String, dynamic>> items, Color color, bool isEarning){
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context,index){
      return Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(isEarning ? Icons.arrow_upward : Icons.arrow_downward, color:color,),
          ),
          title: Text(items[index]['title']),
          subtitle: Text(items[index]['date'].toString()),
          trailing: Text('৳ ${items[index]['amount']}', style: TextStyle(
            color: color,
            fontSize: 15
          ),),
        ),
      );
    },
  );
}
