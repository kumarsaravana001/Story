import 'package:flutter/material.dart';

class CreditNoteForm extends StatefulWidget {
  const CreditNoteForm({super.key});

  @override
  State<CreditNoteForm> createState() => _CreditNoteFormState();
}

class _CreditNoteFormState extends State<CreditNoteForm> {
  //DropDown
  final TextEditingController _customernameddcontroller =
      TextEditingController();
  final TextEditingController _salesinchargeddcontroller =
      TextEditingController();
  final TextEditingController _reasonddcontroller = TextEditingController();

  //other
  final TextEditingController _creditNoteController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _creditNoteAmountController =
      TextEditingController();
  DateTime selectedDate = DateTime.now();
  String selectedOption1 = '';
  String selectedOption2 = '';
  String selectedOption3 = '';

  @override
  void dispose() {
    _customernameddcontroller.dispose();
    _salesinchargeddcontroller.dispose();
    _reasonddcontroller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Customer details",
                        style: TextStyle(fontSize: 25),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.help_outline,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
                TextFormField(
                  controller: _customernameddcontroller,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    labelText: 'Credit Note',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: DropdownButtonFormField<String>(
                      value:
                          selectedOption1.isNotEmpty ? selectedOption1 : null,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption1 = newValue!;
                          _customernameddcontroller.text = newValue;
                        });
                      },
                      hint: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Customer Name'),
                      ),
                      items: ['New Customer', 'Old Customer', 'NA']
                          .map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(value1),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _creditNoteController,
                  decoration: InputDecoration(
                    labelText: 'Credit Note',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _dateController,
                  onTap: () => _selectDate(context),
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Select Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: IconButton(
                      onPressed: () => _selectDate(context),
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Sales in-charge",
                        style: TextStyle(fontSize: 25),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.help_outline,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _salesinchargeddcontroller,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    labelText: 'Credit Note',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: DropdownButtonFormField<String>(
                      value:
                          selectedOption2.isNotEmpty ? selectedOption2 : null,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption2 = newValue!;
                          _salesinchargeddcontroller.text = newValue;
                        });
                      },
                      hint: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Sales in-charge'),
                      ),
                      items: ['Testing', 'Deployment', 'New Changes']
                          .map((String value2) {
                        return DropdownMenuItem<String>(
                          value: value2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(value2),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text(
                        "Reason",
                        style: TextStyle(fontSize: 25),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.help_outline,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _reasonddcontroller,
                  decoration: InputDecoration(
                    labelText: 'Credit Note',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: DropdownButtonFormField<String>(
                      value:
                          selectedOption3.isNotEmpty ? selectedOption3 : null,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption3 = newValue!;
                          _reasonddcontroller.text = newValue;
                        });
                      },
                      hint: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Reason for credit note'),
                      ),
                      items: ['Testing 1', 'Testing 2', 'Testing 3']
                          .map((String value3) {
                        return DropdownMenuItem(
                          value: value3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(value3),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _creditNoteAmountController,
                  decoration: InputDecoration(
                    labelText: 'Credit Note amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
