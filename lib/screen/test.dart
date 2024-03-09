import 'package:flutter/material.dart';

class BookQueuePage extends StatefulWidget {
  @override
  _BookQueuePageState createState() => _BookQueuePageState();
}

class _BookQueuePageState extends State<BookQueuePage> {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Queue'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Select Year: '),
                DropdownButton<int>(
                  value: selectedYear,
                  onChanged: (int? value) {
                    setState(() {
                      selectedYear = value!;
                    });
                  },
                  items: List.generate(
                    10,
                    (index) => DropdownMenuItem<int>(
                      value: DateTime.now().year + index,
                      child: Text('${DateTime.now().year + index}'),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Text('Select Month: '),
                DropdownButton<int>(
                  value: selectedMonth,
                  onChanged: (int? value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                  items: List.generate(
                    12,
                    (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Selected Year: $selectedYear, Month: $selectedMonth',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
