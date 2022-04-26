import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.orange,
          title: Text('Faq'),
         ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  EntryItem(data[index]),
            itemCount: data.length,
            ),
          ),
        ],
      ),

    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    '1) What precautions should we take to stop the spread of covid-19 virus? ',
    <Entry>[
      Entry(
          'a)Wash your hands. \nb)Avoid close contact. \nc)Stay home when you are sick. \nd)Cover your mouth and nose with a mask when your in crowd.'),
    ],

  ),
  Entry(
    '2) What are the symptoms of covid-19 virus? ',
    <Entry>[
      Entry(
          'a)Fever. \nb)Tiredness. \nc)Dry cough. \nd)Fatigue. \ne)Loss of taste.'),
    ],
  ),
  Entry(
    '3) what is the full form of AIDS?',
    <Entry>[
      Entry(
          'AIDS stands for Acquired Immune Deficiency Syndrome.'),
    ],
  ),
  Entry(
    '4) What is the normal blood pressure of an human being?',
    <Entry>[
      Entry(
          'Normal blood pressure should be between 80 to 120 range. (120/80) '),
    ],
  ),
  Entry(
    '5) What are side effects of crocin tablets?',
    <Entry>[
      Entry(
          'a)Liver damage. \nb)Skin rash. \nc)Blisters. \nd)Itching.'),
    ],
  ),
  Entry(
    '6) Food that may help in reducing acidity?',
    <Entry>[
      Entry(
          'Ginger, Vegetables, Egg white, Oatmeal, etc.'),
    ],
  ),
  Entry(
    '7) What are common symptoms of cancer?',
    <Entry>[
      Entry(
          "a)Fatigue. \nb)Sores that don't heal. \nc)Change in weight. \nd)Cough or hoarseness that doesn't go away."),
    ],
  ),
  Entry(
    '8) What is the first sign of cancer? ',
    <Entry>[
      Entry(
          'A lump or thickening of skin can be an early stage of cancer.'),
    ],
  ),
  Entry(
    '9) What are the basic medicines taken for curing typhoid?',
    <Entry>[
      Entry(
          'a)Ceftriaxone. \nb)Ciprofloxacin. \nc)Azithromycin.'),
    ],
  ),
  Entry(
    '10) Which blood group is also known as universal donor?',
    <Entry>[
      Entry(
          'O -ve.'),
    ],
  ),
  Entry(
    '11) How long am I contagious when I have the flu or a cold?',
    <Entry>[
      Entry(
          "As long as you have symptoms. Your ability to spread these viruses remains until the last sniffle, and you're contagious 24 hours before you first show symptoms."),
    ],
  ),
  Entry(
    "12) What's a sure way to stay cancer-free?",
    <Entry>[
      Entry(
          "There isn't one. The ugly truth is, some people who do everything right get cancer anyway. Still, bad habits worsen your odds. Tobacco use causes about one in three cancers overall, and diet, inactivity, and obesity contribute to another third of cases."),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
