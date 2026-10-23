// Reads public string fields from Firebase's generated plist files.
// Owns the small XML lookup shared by native synchronization tools.
// Does not parse credentials or modify configuration.

export function plistString(source, key) {
  return source.match(new RegExp('<key>' + key + '</key>\\s*<string>([^<]+)</string>'))?.[1];
}
