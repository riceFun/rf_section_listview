
class Person {
  String name;
  num height;
  Person(this.name,this.height);
}

class PersonGroup {
  String groupName;
  List<Person> persons;
  PersonGroup(this.groupName,this.persons);
}

final person1 = Person('user1', 185);
final person2 = Person('user2', 175);
final person3 = Person('user3', 195);
final person4 = Person('user4', 165);
final person5 = Person('user5', 195);
final person6 = Person('user6', 165);
final person7 = Person('user7', 195);
final person8 = Person('user8', 165);
final person9 = Person('user9', 195);
final person10 = Person('user10', 165);
final person11 = Person('user11', 195);
final person12 = Person('user12', 165);

final personGroup1 = PersonGroup('group1', [person1, person2, person3, person4, person5, person6, person7, person8]);
final personGroup2 = PersonGroup('group2', [person3, person4,person1, person2, person3, person4,]);
final personGroup3 = PersonGroup('group3', [person10, person12]);
final personGroup4 = PersonGroup('group5', [person10, person12]);
final personGroup5 = PersonGroup('group6', [person10, person12]);
final personGroup6 = PersonGroup('group7', [person1, person2, person3, person4, person5, person6, person7, person8,person10, person12]);
final personGroup7 = PersonGroup('group4', [person10, person12]);


final personGroups = [personGroup1, personGroup2,personGroup3,personGroup4,personGroup5,personGroup6,personGroup7];