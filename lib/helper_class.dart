import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model_class.dart';

class DBHelper {
  DBHelper._();
  String TABLE = "animal";
  List<String> animal = [
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Lion','The lion is a large felid of the genus Panthera native mainly to Africa. It has a muscular,deep-chested body, short, rounded head, round ears, and a hairy tuft at the end of itstail. It is sexuallydimorphic; adult male lions are larger than females and have aprominentmane.','https://i.pinimg.com/originals/3c/e7/b9/3ce7b975d0c5a005ef4b1ce8463da719.png')",
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Elephant','Elephants are truly fascinating animals, besides the obvious trunk and big ears, they have a number of other specialised parts of their bodies that are incredibly interesting!','https://images.unsplash.com/photo-1544211412-2a32426e7fd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGhlcmQlMjBvZiUyMGVsZXBoYW50fGVufDB8fDB8fA%3D%3D&w=1000&q=80')",
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Tiger','The tiger is the largest living cat species and a member of the genus Panthera. It is mostrecognisable for its dark vertical stripes on orange-brown fur with a lighterunderside. It is an apexpredator, primarily preying on ungulates such as deer andwildboar.','https://media.istockphoto.com/photos/caged-tiger-picture-id827352892?k=20&m=827352892&s=612x612&w=0&h=mTCR3amzIT7sOcicjwetTY4GhdSI8G2vJO-KDz_3MV8=')",
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Horse','The horse is a domesticated one-toed hoofed mammal. It belongs to the taxonomicfamily Equidae and is one of two extant subspecies of Equus ferus. The horse hasevolved over the past 45 to 55 million years from a small multi-toed creature,Eohippus, into the large, single-toed animal oftoday.','https://i.pinimg.com/736x/70/7e/ab/707eabcc4792c52ff73c96eaaa21ca3b.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Gorilla','Gorillas areground-dwelling, predominantly herbivorous great apes that inhabit the tropicalforests of centralSub-SaharanAfrica.','https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Gorille_des_plaines_de_l%27ouest_%C3%A0_l%27Espace_Zoologique.jpg/1200px-Gorille_des_plaines_de_l%27ouest_%C3%A0_l%27Espace_Zoologique.jpg')",

    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Parrot','Parrots, also known as psittacines, are birds of the roughly 398 species in 92 genera comprisingthe order Psittaciformes, found mostly in tropical and subtropicalregions.','https://images.unsplash.com/photo-1618281377501-88c2328cbb9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JlZW4lMjBwYXJyb3R8ZW58MHx8MHx8&w=1000&q=80')",
    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Pigeon','Columbidae is a bird family consisting of pigeons and doves. It is the only family in the orderColumbiformes.','https://upload.wikimedia.org/wikipedia/commons/5/56/Paloma_brav%C3%ADa_%28Columba_livia%29%2C_Palacio_de_Nymphenburg%2C_M%C3%BAnich%2C_Alemania01.JPG')",
    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Sparrow','Males have smart black bibs, bright rufous napes, and stunningly patterned wings withbrilliant buffs and browns. Underparts are palepearly-gray.','https://cdn.britannica.com/32/62532-050-51F638D8/size-throat-patch-house-sparrow-status-rank.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Robin','TheAmerican robin is a migratory songbird of the true thrush genus and Turdidae, thewider thrushfamily.','https://i.guim.co.uk/img/media/99ad934355341dcdf3f828993120baa485fa675d/0_395_3230_1938/master/3230.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=f4b2eb4cf97a0dc2d36fe8e767e17706')",
    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Peacock','Peafowl isa common name for three bird species in the genera Pavo and Afropavo of thefamily Phasianidae, the pheasants and theirallies.','https://images.unsplash.com/photo-1572877183903-f6f33bbfa7c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&w=1000&q=80')",

    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Gold','The goldfish isa freshwater fish in the family Cyprinidae of order Cypriniformes. It is commonlykept as a pet in indoor aquariums, and is one of the most popular aquarium fish.Goldfish released into the wild have become an invasive pest in parts of NorthAmerica.','https://images.unsplash.com/photo-1628006020983-5f032bedb369?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z29sZGZpc2h8ZW58MHx8MHx8&w=1000&q=80')",
    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Oscar','The oscar is as pecies of fish from the cichlid family known under a variety of common names,including tiger oscar, velvet cichlid, and marble cichlid. In tropical South America,where the species naturally resides, A. ocellatus specimens are often found for saleas a food fish in the localmarkets.','https://img1.wsimg.com/isteam/ip/1e359bb4-cabe-4e03-bd77-8db8ba90a350/ols/My%20Post%20-%202020-09-22T205737.671.png/:/rs=w:1200,h:1200')",
    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Herring','Herring are forage fish, mostly belonging to the familyClupeidae','https://live.staticflickr.com/6156/6192816684_2dd9ed2ee5_b.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Haddock','Thehaddock is a saltwater ray-finned fish from the family Gadidae, the true cods. It is theonly species in the monotypic genusMelanogrammus.','https://cookedbest.com/wp-content/uploads/2022/01/fish-g2cd10553c_1280-1024x682.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Megrim','The megrim,megrim sole, whiff, or Cornish sole is a species of left-eyed flatfish in the familyScophthalmidae.','https://i.pinimg.com/736x/28/31/dc/2831dcdadd5024224ba6755bae26b52f.jpg')",

    "INSERT INTO animal(type,name,detail,image)VALUES('REPTILES','Crocodile ','Crocodiles or truecrocodiles are large semiaquatic reptiles that live throughout the tropics in Africa,Asia, the Americas andAustralia.','https://images.unsplash.com/photo-1614301970871-06870c281354?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y3JvY29kaWxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80')",
    "INSERT INTO animal(type,name,detail,image)VALUES('REPTILES','Lizard ','Lizards are a widespread group of squamate reptiles, with over 6,000 species, rangingacross all continents except Antarctica, as well as most oceanic islandchains.','https://i.guim.co.uk/img/media/52cc3cd424f02bef13a63ce9f1f455e054485ca0/197_220_3706_2224/master/3706.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=c55fc26562f96babf20d4137cbaa8d27')",
    "INSERT INTO animal(type,name,detail,image)VALUES('REPTILES','Turtle ','Turtles are reptiles of the order Testudines, also known asChelonia.','https://cdn1.i-scmp.com/sites/default/files/styles/og_image_scmp_obituary/public/2013/07/31/turtle-burger-l.jpg?itok=fcylyPGI')",
    "INSERT INTO animal(type,name,detail,image)VALUES('REPTILES','Snake ','Snakes are elongated, limbless, carnivorous reptiles of the suborder Serpentes. Like all othersquamates,snakes are ectothermic, amniote vertebrates covered in overlappingscales. ','https://i.pinimg.com/originals/1b/44/2a/1b442ab4b3fc45784877a589110f8436.jpg')",
  ];
  var database;
  initDB() async {
    if (database == null) {
      database = openDatabase(
        join(await getDatabasesPath(), "animal_1.db"),
        version: 1,
        onCreate: (db, version) {
          String sql =
              "CREATE TABLE IF NOT EXISTS $TABLE(id INTEGER, type TEXT, name TEXT,detail TEXT, image TEXT,PRIMARY KEY('id' AUTOINCREMENT))";
          db.execute(sql);
          insertData();
        },
      );
    }
    return database;
  }

  void insertData() async {
    var db = await initDB();
    animal.forEach((element) async {
      var res = await db.rawInsert(element);
    });
  }

  getAllAnimals({required String type}) async {
    var db = await initDB();
    String sql = "SELECT * FROM $TABLE WHERE type = '$type'";
    List<Map<String, dynamic>> res = await db.rawQuery(sql);
    List<Animal> response =
        res.map((record) => Animal.fromMap(record)).toList();
    response.forEach((element) {});
    return response;
  }

  getAnimalById({required int id}) async {
    var db = await initDB();
    String sql = "SELECT * FROM $TABLE WHERE id = $id";
    List<Map<String, dynamic>> res = await db.rawQuery(sql);
    List<Animal> response =
        res.map((record) => Animal.fromMap(record)).toList();
    return response;
  }
}

DBHelper dbh = DBHelper._();
