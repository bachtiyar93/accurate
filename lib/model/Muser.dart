class User {

  String? name;
  String? address;
  String? email;
  String? phoneNumber;
  String? city;
  String? id;
  String? query;

  User({
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
    this.city,
    this.id,
    this.query,
  });
  User.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    address = json['address']?.toString();
    email = json['email']?.toString();
    phoneNumber = json['phoneNumber']?.toString();
    city = json['city']?.toString();
    id = json['id']?.toString();
    query = json['query']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['city'] = city;
    data['id'] = id;
    data['query'] = query;
    return data;
  }
}

class IntrospectionQuery {
  final Schema schema;

  IntrospectionQuery({required this.schema});

  factory IntrospectionQuery.fromJson(Map<String, dynamic> json) {
    return IntrospectionQuery(
      schema: Schema.fromJson(json['__schema']),
    );
  }
}

class Schema {
  final QueryType queryType;
  final MutationType mutationType;
  final SubscriptionType subscriptionType;
  final List<FullType> types;
  final List<Directive> directives;

  Schema({
    required this.queryType,
    required this.mutationType,
    required this.subscriptionType,
    required this.types,
    required this.directives,
  });

  factory Schema.fromJson(Map<String, dynamic> json) {
    return Schema(
      queryType: QueryType.fromJson(json['queryType']),
      mutationType: MutationType.fromJson(json['mutationType']),
      subscriptionType: SubscriptionType.fromJson(json['subscriptionType']),
      types: (json['types'] as List).map((type) => FullType.fromJson(type)).toList(),
      directives: (json['directives'] as List).map((directive) => Directive.fromJson(directive)).toList(),
    );
  }
}

class QueryType {
  final String name;

  QueryType({required this.name});

  factory QueryType.fromJson(Map<String, dynamic> json) {
    return QueryType(
      name: json['name'],
    );
  }
}

class MutationType {
  final String name;

  MutationType({required this.name});

  factory MutationType.fromJson(Map<String, dynamic> json) {
    return MutationType(
      name: json['name'],
    );
  }
}
class SubscriptionType {
  final String name;

  SubscriptionType({required this.name});

  factory SubscriptionType.fromJson(Map<String, dynamic> json) {
    return SubscriptionType(
      name: json['name'],
    );
  }
}

class FullType {
  // Implement properties for FullType based on your specific requirements.
  // You can add fields like 'kind', 'name', 'description', etc.
  // Example:
  final String kind;
  final String name;
  final String description;

  FullType({
    required this.kind,
    required this.name,
    required this.description,
  });

  factory FullType.fromJson(Map<String, dynamic> json) {
    return FullType(
      kind: json['kind'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class Directive {
  // Implement properties for Directive based on your specific requirements.
  // You can add fields like 'name', 'description', 'locations', etc.
  // Example:
  final String name;
  final String description;
  final List<String> locations;

  Directive({
    required this.name,
    required this.description,
    required this.locations,
  });

  factory Directive.fromJson(Map<String, dynamic> json) {
    return Directive(
      name: json['name'],
      description: json['description'],
      locations: (json['locations'] as List).cast<String>(),
    );
  }
}
