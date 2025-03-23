class User {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final Login login;
  final DateOfBirth dob;
  final Registered registered;
  final String phone;
  final String cell;
  final Id id;
  final Picture picture;
  final String nat;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'],
      name: Name.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'],
      login: Login.fromJson(json['login']),
      dob: DateOfBirth.fromJson(json['dob']),
      registered: Registered.fromJson(json['registered']),
      phone: json['phone'],
      cell: json['cell'],
      id: Id.fromJson(json['id']),
      picture: Picture.fromJson(json['picture']),
      nat: json['nat'],
    );
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final Coordinates coordinates;
  final Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      coordinates: Coordinates.fromJson(json['coordinates']),
      timezone: Timezone.fromJson(json['timezone']),
    );
  }
}

class Street {
  final int number;
  final String name;

  Street({required this.number, required this.name});

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'],
      name: json['name'],
    );
  }
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class Timezone {
  final String offset;
  final String description;

  Timezone({required this.offset, required this.description});

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      offset: json['offset'],
      description: json['description'],
    );
  }
}

class Login {
  final String uuid;
  final String username;

  Login({required this.uuid, required this.username});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      uuid: json['uuid'],
      username: json['username'],
    );
  }
}

class DateOfBirth {
  final String date;
  final int age;

  DateOfBirth({required this.date, required this.age});

  factory DateOfBirth.fromJson(Map<String, dynamic> json) {
    return DateOfBirth(
      date: json['date'],
      age: json['age'],
    );
  }
}

class Registered {
  final String date;
  final int age;

  Registered({required this.date, required this.age});

  factory Registered.fromJson(Map<String, dynamic> json) {
    return Registered(
      date: json['date'],
      age: json['age'],
    );
  }
}

class Id {
  final String name;
  final String value;

  Id({required this.name, required this.value});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      name: json['name'],
      value: json['value'] ?? '',
    );
  }
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({required this.large, required this.medium, required this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}
