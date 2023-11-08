class QuestionAnswers {
  const QuestionAnswers({required this.question, required this.options});

  final String question;
  final List<String> options;

  List<String> shuffledOptions() {
    final shuffled = List.of(options);
    shuffled.shuffle();
    return shuffled;
  }
}

const qusLibrary = [
  QuestionAnswers(
    question: "Which programming language is used for Flutter development?",
    options: ["Dart", "Java", 'Swift', 'Python'],
  ),
  QuestionAnswers(
    question: "What is the purpose of the Flutter Engine?",
    options: [
      "To compile Dart code to machine code",
      "To provide a library of pre-built widgets",
      "To manage the state of the application",
      "To handle HTTP requests"
    ],
  ),
  QuestionAnswers(
    question: "What is the purpose of the runApp() function in Flutter?",
    options: [
      "To start the Flutter application",
      "To define the layout of the user interface",
      "To handle user input",
      "To manage the state of the application"
    ],
  ),
  QuestionAnswers(
    question: "What is the purpose of the setState() method in Flutter?",
    options: [
      "To manage the state of the application",
      "To create a new widget",
      "To handle user input",
      "To define the layout of the user interface"
    ],
  ),
  QuestionAnswers(
    question: "Which widget is used to display an image in Flutter?",
    options: ["Image", "ImageField", "ImageView", "ImageBox"],
  ),
  QuestionAnswers(
    question: "What is the purpose of the MaterialApp widget in Flutter?",
    options: [
      "To provide a set of material design widgets",
      "To define the layout of the user interface",
      "To handle user input",
      "To manage the state of the application"
    ],
  ),
  QuestionAnswers(
    question: "What is the purpose of the Container widget in Flutter?",
    options: [
      "To provide a flexible container for layout and styling",
      "To create a new widget",
      "To manage the state of the application",
      "To provide a set of material design widgetsS"
    ],
  ),
  QuestionAnswers(
    question: 'What are the main building blocks of Flutter UIs?',
    options: [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuestionAnswers(
    question: 'How are Flutter UIs built?',
    options: [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android',
    ],
  ),
  QuestionAnswers(
    question: 'What is the purpose of a StatefulWidget?',
    options: [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuestionAnswers(
    question:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    options: [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuestionAnswers(
    question: 'What happens if you change data in a StatelessWidget?',
    options: [
      'To build a widget tree that does not depend on any mutable state',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuestionAnswers(
    question: 'How should you update data inside of StatefulWidgets?',
    options: [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
  QuestionAnswers(
    question:
        "Who developed the Flutter Framework and continues to maintain it today?",
    options: ['Google', 'Facebook', 'Microsoft', 'Oracle'],
  ),
  QuestionAnswers(
      question:
          "What element is used as an identifier for components when programming in Flutter?",
      options: ["Key", "Widget", "Element", "Serial"])
];
