import 'dart:math';

class Item {
  Item({
    required this.image,
    required this.artist,
    required this.packet,
    required this.price,
    required this.owner,
    required this.counter,
    required this.date,
  });

  String image;
  String artist;
  int price;
  String packet;
  String owner;
  int counter;
  String date;
}

late int artist_index;

List artist = [
  'Zenek Martyniuk',
  'Bracia Figo Fagot',
  'Akcent',
  'Discopoloman',
  'Czadoman'
];
const List packet = [
  'Silver',
  'Gold',
  'Black',
];
List editable_packet = [
  'Silver',
  'Gold',
  'Black',
];
List owner = [
  'Feliks',
  'Piotr',
  'Lemo',
  'Tomasz',
  'Krzysztof',
  'Banan',
  'Kijek',
  'Adam',
  'Rafał',
  'Kacper',
  'Kamil',
  'Andrzej',
  'Ryszard'
];

List<String> image = [
  'assets/artists/figo1.jpg',
  'assets/artists/figo2.jpg',
  'assets/artists/figo3.jpg',
  'assets/artists/mig1.jpg',
  'assets/artists/mig2.jpg',
  'assets/artists/spiz1.jpg',
  'assets/artists/disco1.jpg',
];

List<Item> marketplace_items = [];
List<Item> owned_items = [];
List<Item> cart_items = [];
List<Item> store_items = [];

Random random = new Random();

List<Item> generateItems(how_many) {
  return List.generate(how_many, (int index) {
    String random_artist = (artist..shuffle()).first;
    return Item(
      image: generateImage(random_artist),
      artist: random_artist,
      packet: (editable_packet..shuffle()).first,
      price: random.nextInt(100),
      owner: (owner..shuffle()).first,
      counter: random.nextInt(1000),
      date: (random.nextInt(30).toString()) +
          '-' +
          random.nextInt(12).toString() +
          '-' +
          (random.nextInt(20) + 2000).toString(),
    );
  });
}

checkPrice(String packet) {
  if (packet == 'Gold') {
    return 10;
  }
  if (packet == 'Silver') {
    return 5;
  }
  if (packet == 'Black') {
    return 15;
  }
}

num cart_price = 0;

generateImage(String artist) {
  if (artist == 'Zenek Martyniuk') {
    return 'assets/artists/spiz1.jpg';
  }
  if (artist == 'Bracia Figo Fagot') {
    return 'assets/artists/figo1.jpg';
  }
  if (artist == 'Akcent') {
    return 'assets/artists/akcent1.jpg';
  }
  if (artist == 'Discopoloman') {
    return 'assets/artists/mig1.jpg';
  }
  if (artist == 'Czadoman') {
    return 'assets/artists/dbomb1.jpg';
  }
}

sum_payment(int how_many) {
  int payment = 0;
  for (var i = 0; i < how_many; i++) {
    payment += cart_items[i].price;
  }
  return payment;
}

int i = 0;
int j = 0;
List<Item> generateStoreItems2(int i, int j) {
  return List.generate(
    10,
    (int index) {
      return Item(
        image: generateImage(artist[i]),
        artist: artist[i],
        packet: packet[j],
        price: checkPrice(packet[j]),
        owner: '',
        counter: 0,
        date: (random.nextInt(30).toString() +
            '.' +
            random.nextInt(12).toString() +
            '.' +
            (random.nextInt(20) + 2000).toString()),
      );
    },
  );
}

String dropdownValue = 'Blik';
int counter = 1;
Item generateCartItems(
  artist,
  packet,
  counter,
) {
  return Item(
    image: generateImage(artist),
    artist: artist,
    packet: packet,
    price: checkPrice(packet),
    owner: '',
    counter: counter,
    date: (random.nextInt(30).toString() +
        '.' +
        random.nextInt(12).toString() +
        '.' +
        (random.nextInt(20) + 2000).toString()),
  );
}
