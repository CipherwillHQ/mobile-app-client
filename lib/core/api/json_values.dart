// Reads serialized contract values explicitly
// Owns JSON map and list adapters.
// Does not perform networking or decryption.
typedef Json = Map<String, dynamic>;
Json asJson(Object? value) => value == null
    ? <String, dynamic>{}
    : Map<String, dynamic>.from(value as Map);
List<Json> jsonList(Object? value) =>
    (value as List? ?? []).whereType<Map>().map(asJson).toList();
String label(Json value) =>
    (value['title'] ??
            value['name'] ??
            value['email'] ??
            value['first_name'] ??
            value['id'] ??
            '')
        .toString();
