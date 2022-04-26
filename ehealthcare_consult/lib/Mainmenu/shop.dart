import 'package:flutter/material.dart';
import 'checkout.dart';
class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Online Pharmacy'),
      ),
      body: Column(
        children: <Widget>[
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
class Entry {
  Entry(this.title, this.btntitle ,[this.children = const <Entry>[]]);

  final String title;
  final String btntitle;
  final List<Entry> children;

}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Dolo 650 MG Tablets.',
   'Buy Now',
    <Entry>[
      Entry(
        '',
          "Dolo 650 Tablet contains paracetamol, also known as acetaminophen. It is used for the treatment of fever and pain.",),
    ],


  ),
  Entry(
    'Pan 40mg Tablets.',
    'Buy Now',
    <Entry>[
      Entry(
        '',
          'Pan 40 tablet is a medicine used to reduce stomach acid. It contains Pantoprazole as an active ingredient. It also has anti-acid reflux actions. It is used to treat stomach ulcers, gastroesophageal reflux disease (GERD) and other acidity related problems.'),
    ],
  ),
  Entry(
    'Ecosprin 75mg Tablets.',
    'Buy Now',
    <Entry>[
      Entry(
        '',
          'Ecosprin 75 tablet is an antiplatelet medicine. It is used to prevent the risk of heart attacks, stroke and chest pain (heart-related). It is also used to reduce the chances of formation of clot after heart surgery, in patients with a risk of vascular thrombosis (blood clot obstructing blood flow in a vein).',
      ),
    ],
  ),
  Entry(
    'Shelcal 500mg Tablets.',
    'Buy Now',
    <Entry>[
      Entry(
          '',
          'Shelcal 500 Tablet is a vitamin and mineral supplement. It contains Calcium and Vitamin D3 (cholecalciferol /colecalciferol) as the main ingredient. Calcium and Vitamin D3 are two crucial components for maintaining healthy bones and joints..'),
    ],
  ),
  Entry(
    'Evion 400mg Tablets.',
    'Buy Now',
    <Entry>[
      Entry(
          '',
          'Evion 400 capsule is a vitamin supplement. It contains Vitamin E (also known as tocopherol) as its active ingredient. Vitamin E is a fat-soluble vitamin with distinctive antioxidant properties. It works as an antioxidant and protects body cells from oxidative damage.'),
    ],
  ),
  Entry(
    'New Celin 500mg Tablets.',
    'Buy Now',
    <Entry>[
      Entry(
          '',
          'New Celin 500 tablet contains vitamin C as its main component. Vitamin C is a water-soluble vitamin. It is one of the essential dietary components required for growth, immunity and development.'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root,context) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: <Widget>[
        ListTile(
          title: Text(root.children.map((e)=> e.btntitle).first),
         leading: SizedBox(


           // width: 200,
           // height: 400,
           child: Container(
               color: Colors.red,
               width: 150,

               child: Image.asset('images/tablets.jpg',fit:BoxFit.cover))
           ,
         ),


        ),
        ElevatedButton(onPressed:(){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Checkout()));
        },
        child: Text(root.btntitle)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry,context);
  }
}
