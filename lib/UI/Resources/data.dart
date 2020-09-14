
class User {
  int id;
  int weight;
  String gender;

  User({this.weight, this.gender, this.id});

  Map<String, dynamic> toMap() => {
        "id": id,
        "weight": weight,
        "gender": gender,
      };

  factory User.fromMap(Map<String, dynamic> json) => new User(
        id: json["id"],
        weight: json["weight"],
        gender: json["gender"],
      );

  void setWeight(int getWeight) {
    weight = getWeight;
    print("=>>");
    print(weight);
  }

  void setGender(String getGender) {
    gender = getGender;
  }

  int getWeight() {
    return weight;
  }

  String getGender() {
    return gender;
  }

  @override
  String toString() {
    // TODO: implement toString

    return 'User{id: $id, weight: $weight, gender: $gender}';
  }
}


// class CalculateModel {
//   int totalWater;
//   int totalIntake;

//   CalculateModel({this.totalIntake, this.totalWater});

//   void setTotalWater(int getTotalWater) {
//     totalWater = getTotalWater;
//   }

//   void setTotalIntake(int getTotalIntake) {
//     totalIntake = getTotalIntake;
//   }

//   int getTotalWater() {
//     return totalWater;
//   }

//   int getTotalIntake() {
//     return totalIntake;
//   }

//   double weightPounds;

//   int calculateIntake(int weight) {
//     //print(weight);

//     weightPounds = weight * 2.205;
//     print(weightPounds);

//     totalWater = ((weightPounds * 0.66) * 29.58).toInt();
//     print(totalWater);
//     return totalWater;
//   }
// }
