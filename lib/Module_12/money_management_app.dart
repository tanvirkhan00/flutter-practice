import 'package:flutter/material.dart';

class MoneyManagementApp extends StatefulWidget {
  const MoneyManagementApp({super.key});

  @override
  State<MoneyManagementApp> createState() => _MoneyManagementAppState();
}

class _MoneyManagementAppState extends State<MoneyManagementApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _showFButtonA(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context){
      return Row(
        children: [
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
              child: Text('Add Earning')),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),
              child: Text('Add Expense')),
        ],
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
            Tab(text: 'Earning', icon:Icon(Icons.arrow_upward, color: Colors.white,),),
            Tab(text: 'Expend', icon:Icon(Icons.arrow_downward),)
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              _summarycard(title: 'Earning', color: Colors.green, value: 2000),
              _summarycard(title: 'Expense', color: Colors.red, value: 1500),
              _summarycard(title: 'Balance', color: Colors.blue, value: 500),
            ],
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
