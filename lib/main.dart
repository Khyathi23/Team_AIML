import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Fusion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/learn_fusion.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/learn_fusion.png'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LanguageSelectionScreen()),
                    );
                  },
                  child: Text('STEP IN'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> languages = [
    {'English': 'English'},
    {'Español': 'Spanish'},
    {'Français': 'French'},
    {'Deutsch': 'German'},
    {'हिन्दी': 'Hindi'},
    {'తెలుగు': 'Telugu'},
    {'தமிழ்': 'Tamil'},
    {'বাংলা': 'Bengali'},
    {'ਪੰਜਾਬੀ': 'Punjabi'},
    {'ગુજરાતી': 'Gujarati'},
    {'മലയാളം': 'Malayalam'},
    {'ಕನ್ನಡ': 'Kannada'},
    {'मराठी': 'Marathi'},
    {'اردو': 'Urdu'},
    {'فارسی': 'Persian'},
    {'日本語': 'Japanese'},
    {'中文': 'Chinese'},
    {'한국어': 'Korean'},
    {'русский': 'Russian'},
    {'عربي': 'Arabic'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          String displayLanguage = languages[index].keys.first;
          String language = languages[index][displayLanguage]!;
          return ListTile(
            title: Text(displayLanguage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthOptionsScreen(language: language)),
              );
            },
          );
        },
      ),
    );
  }
}

class AuthOptionsScreen extends StatelessWidget {
  final String language;

  AuthOptionsScreen({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Fusion ($language)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen(language: language)),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen(language: language)),
                );
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final String language;

  LoginScreen({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login ($language)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen(language: language)),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle Google Sign-In
              },
              child: Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  final String language;

  SignupScreen({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup ($language)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle signup
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen(language: language)),
                );
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final String language;

  MainScreen({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Fusion ($language)'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Learn Fusion',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Schedule'),
              onTap: () {
                Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScheduleScreen()),
    );
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Learning Tools'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningToolsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.videogame_asset),
              title: Text('VR'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VRScreen()),
                );
              },
            ),
            ListTile(
  leading: Icon(Icons.trending_up),
  title: Text('Trends'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TrendsScreen()),
    );
  },
),


            ListTile(
  leading: Icon(Icons.star),
  title: Text('Expertise'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExpertiseScreen()),
    );
  },
),

            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to Learn Fusion in $language!'),
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Learn Fusion is an educational app designed to help users learn various subjects in multiple languages. Our mission is to provide high-quality learning tools and resources to make learning accessible to everyone. We offer a variety of features, including language selection, expert tips, and the latest trends in education.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Customer Care Number: 123-456-7890', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Email: support@learnfusion.com', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Day'),
      ),
      body: ListView(
        children: <Widget>[
          for (var day in _daysOfWeek)
            ListTile(
              title: Text(day),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DayScheduleScreen(day: day),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  List<String> get _daysOfWeek => [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
}

class DayScheduleScreen extends StatefulWidget {
  final String day;

  DayScheduleScreen({required this.day});

  @override
  _DayScheduleScreenState createState() => _DayScheduleScreenState();
}

class _DayScheduleScreenState extends State<DayScheduleScreen> {
  final List<Map<String, dynamic>> _tasks = [];
  final _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isEmpty) return;
    setState(() {
      _tasks.add({'task': _taskController.text, 'completed': false});
      _taskController.clear();
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['completed'] = !_tasks[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.day} Schedule'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Add Task',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(task['task']),
                  leading: Checkbox(
                    value: task['completed'],
                    onChanged: (value) => _toggleTask(index),
                  ),
                );
              },
            ),
          ),
          _buildCharts(),
        ],
      ),
    );
  }

  Widget _buildCharts() {
    final completedTasks = _tasks.where((task) => task['completed']).toList();
    final totalTasks = _tasks.length;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text('Progress: ${completedTasks.length} / $totalTasks'),
          // Here you would include your pie chart and line chart widgets.
          // For example:
          // PieChart(data: [completedTasks.length, totalTasks - completedTasks.length]),
          // LineChart(data: [1, 2, 3, 4, 5]), // Example data
        ],
      ),
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final _suggestionsController = TextEditingController();
  int? _rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _suggestionsController,
                decoration: InputDecoration(
                  labelText: 'Suggestions',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your suggestions';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Rating'),
                value: _rating,
                items: [1, 2, 3, 4, 5]
                    .map((int value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    _rating = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please provide a rating';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Feedback submitted')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  final List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}

class LearningToolsScreen extends StatefulWidget {
  @override
  _LearningToolsScreenState createState() => _LearningToolsScreenState();
}

class _LearningToolsScreenState extends State<LearningToolsScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> allCourses = [
    {
      'language': 'Python',
      'course': 'Python for Beginners',
      'platform': 'Udemy',
      'link': 'https://www.udemy.com/course/python-for-beginners/',
      'runEnvironment': 'Python IDLE',
      'game': 'Python Game',
    },
    {
      'language': 'Python',
      'course': 'Python Data Science',
      'platform': 'Coursera',
      'link': 'https://www.coursera.org/specializations/data-science-python',
      'runEnvironment': 'Jupyter Notebook',
      'game': 'PyGame',
    },
    {
      'language': 'C++',
      'course': 'C++ for Beginners',
      'platform': 'Udemy',
      'link': 'https://www.udemy.com/course/cplusplus-for-beginners/',
      'runEnvironment': 'Dev C++',
      'game': 'C++ Game',
    },
    {
      'language': 'Java',
      'course': 'Java Programming',
      'platform': 'Coursera',
      'link': 'https://www.coursera.org/learn/java-programming',
      'runEnvironment': 'IntelliJ IDEA',
      'game': 'Java Game',
    },
    // Add more courses here
  ];

  List<Map<String, dynamic>> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses = allCourses;
  }

  void _filterCourses() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCourses = allCourses.where((course) {
        return course['language'].toLowerCase().contains(query) ||
            course['course'].toLowerCase().contains(query) ||
            course['platform'].toLowerCase().contains(query);
      }).toList();
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Tools'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Courses',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _filterCourses,
                ),
              ),
              onChanged: (value) {
                _filterCourses();
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredCourses[index]['course']),
                    subtitle: Text('${filteredCourses[index]['language']} - ${filteredCourses[index]['platform']}'),
                    onTap: () {
                      _showCourseDetails(filteredCourses[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCourseDetails(Map<String, dynamic> course) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(course['course']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Language: ${course['language']}'),
            Text('Platform: ${course['platform']}'),
            InkWell(
              child: Text('Course Link', style: TextStyle(color: Colors.blue)),
              onTap: () => _launchURL(course['link']),
            ),
            Text('Run Environment: ${course['runEnvironment']}'),
            Text('Game: ${course['game']}'),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  Map<DateTime, List<Event>> _events = {};

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: <Widget>[
          TableCalendar<Event>(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            eventLoader: _getEventsForDay,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay).length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_getEventsForDay(_selectedDay)[index].title),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addEventDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addEventDialog() {
    final _eventController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Event'),
        content: TextField(
          controller: _eventController,
          decoration: InputDecoration(
            hintText: 'Event Title',
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Add'),
            onPressed: () {
              if (_eventController.text.isEmpty) return;
              setState(() {
                if (_events[_selectedDay] != null) {
                  _events[_selectedDay]!.add(Event(_eventController.text));
                } else {
                  _events[_selectedDay] = [Event(_eventController.text)];
                }
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class TrendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trends'),
      ),
      body: Center(
        child: Image.asset('assets/images/trends_image.png'), // Make sure the image is in the assets/images folder
      ),
    );
  }
}     

class ExpertiseScreen extends StatefulWidget {
  @override
  _ExpertiseScreenState createState() => _ExpertiseScreenState();
}

class _ExpertiseScreenState extends State<ExpertiseScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _employees = [
    {
      'name': 'Alice Smith',
      'company': 'TechCorp',
      'role': 'Software Engineer',
      'email': 'alice.smith@techcorp.com',
      'linkedin': 'https://www.linkedin.com/in/alice-smith/',
    },
    {
      'name': 'Bob Johnson',
      'company': 'InnovateInc',
      'role': 'Data Scientist',
      'email': 'bob.johnson@innovateinc.com',
      'linkedin': 'https://www.linkedin.com/in/bob-johnson/',
    },
    // Add more employees here
  ];

  List<Map<String, String>> _filteredEmployees = [];

  @override
  void initState() {
    super.initState();
    _filteredEmployees = _employees;
  }

  void _filterEmployees() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredEmployees = _employees.where((employee) {
        return employee['name']!.toLowerCase().contains(query) ||
               employee['company']!.toLowerCase().contains(query) ||
               employee['role']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expertise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Employees',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _filterEmployees,
                ),
              ),
              onChanged: (value) {
                _filterEmployees();
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredEmployees.length,
                itemBuilder: (context, index) {
                  final employee = _filteredEmployees[index];
                  return ListTile(
                    title: Text(employee['name']!),
                    subtitle: Text('${employee['company']} - ${employee['role']}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmployeeProfileScreen(employee: employee),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeProfileScreen extends StatelessWidget {
  final Map<String, String> employee;

  EmployeeProfileScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ${employee['name']!}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Company: ${employee['company']!}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Role: ${employee['role']!}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: ${employee['email']!}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            InkWell(
              child: Text('LinkedIn Profile', style: TextStyle(color: Colors.blue, fontSize: 18)),
              onTap: () async {
                final url = employee['linkedin']!;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle chat functionality here
              },
              child: Text('Chat'),
            ),
          ],
        ),
      ),
    );
  }
}

class VRScreen extends StatefulWidget {
  @override
  _VRScreenState createState() => _VRScreenState();
}

class _VRScreenState extends State<VRScreen> {
  VideoPlayerController? _videoController;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  void _showOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Bee'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement functionality for Bee
                },
              ),
              ListTile(
                title: Text('Workshop'),
                onTap: () {
                  Navigator.pop(context);
                  _playVideo(context);
                },
              ),
              ListTile(
                title: Text('CAD'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement functionality for CAD
                },
              ),
              ListTile(
                title: Text('Civil'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement functionality for Civil
                },
              ),
              ListTile(
                title: Text('Sensors'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement functionality for Sensors
                },
              ),
              // Add more options here as needed
            ],
          ),
        );
      },
    );
  }

  void _playVideo(BuildContext context) {
    // Replace 'assets/videos/workshop.mp4' with the path to your video file
    _videoController = VideoPlayerController.asset('assets/videos/innov8ers.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoController!.play();
      });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Workshop Video'),
          content: _videoController!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: VideoPlayer(_videoController!),
                )
              : Center(child: CircularProgressIndicator()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual Reality'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the VR Section!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showOptions(context);
              },
              child: Text('Enter VR'),
            ),
          ],
        ),
      ),
    );
  }
}


class Event {
  final String title;

  Event(this.title);

  @override
  String toString() => title;
}

