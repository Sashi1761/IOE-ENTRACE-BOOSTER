import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(EventCalendarApp());
}

class EventCalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventCalendarScreen(),
    );
  }
}

class Event {
  final String eventName;
  final DateTime eventDate;
  bool isCompleted;

  Event(this.eventName, this.eventDate, {this.isCompleted = false});
}

class EventCalendarScreen extends StatefulWidget {
  @override
  _EventCalendarScreenState createState() => _EventCalendarScreenState();
}

class _EventCalendarScreenState extends State<EventCalendarScreen> {
  late SharedPreferences _prefs;
  late List<Event> _events;
  late CalendarController _calendarController;
  late DateTime _selectedDate;
  TextEditingController _eventTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    _events = [];
    _calendarController = CalendarController();
    _selectedDate = DateTime.now();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadEvents();
  }

  void _loadEvents() {
    List<String>? eventList = _prefs.getStringList('events');
    if (eventList != null) {
      setState(() {
        _events = eventList
            .map((event) {
              List<String> eventData = event.split(',');
              return Event(
                eventData[0],
                DateTime.parse(eventData[1]),
                isCompleted: eventData[2] == 'true',
              );
            })
            .toList();
      });
    }
  }

  Future<void> _saveEvents() async {
    List<String> eventList = _events
        .map((event) =>
            '${event.eventName},${event.eventDate.toString()},${event.isCompleted}')
        .toList();
    await _prefs.setStringList('events', eventList);
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _addEvent(DateTime date) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Event'),
        content: TextFormField(
          controller: _eventTextController,
          decoration: InputDecoration(labelText: 'Event Name'),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text('Add'),
            onPressed: () {
              String eventName = _eventTextController.text;
              Event newEvent = Event(eventName, date);
              setState(() {
                _events.add(newEvent);
              });
              _saveEvents();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _deleteEvent(int index) {
    setState(() {
      _events.removeAt(index);
    });
    _saveEvents();
  }

  void _toggleEventCompletion(int index) {
    setState(() {
      _events[index].isCompleted = !_events[index].isCompleted;
    });
    _saveEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Event Calendar', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          TableCalendar(
  startingDayOfWeek: StartingDayOfWeek.monday,
  focusedDay: _selectedDate,
  firstDay: DateTime(DateTime.now().year - 1),
  lastDay: DateTime(DateTime.now().year + 1),
  calendarStyle: CalendarStyle(
    todayDecoration: const BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.circle,
    ),
    selectedDecoration: BoxDecoration(
      color: Colors.blue.withOpacity(0.5),
      shape: BoxShape.circle,
    ),
  ),
  onDaySelected: (date, _) {
    _addEvent(date);
  },
),

          Expanded(
            child: ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                Event event = _events[index];
                return ListTile(
                  leading: Checkbox(
                    value: event.isCompleted,
                    onChanged: (_) => _toggleEventCompletion(index),
                  ),
                  title: Text(event.eventName),
                  subtitle: Text(event.eventDate.toString()),
                  trailing: IconButton(
                    icon:const Icon(Icons.delete),
                    onPressed: () => _deleteEvent(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
      heroTag: FloatingActionButtonThemeData(
    backgroundColor:const  Color.fromARGB(255, 110, 4, 76), 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), 
    ),
  ),
        onPressed: () {
          _addEvent(_selectedDate);
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
