mixin PatternMatchable<T extends TypeConverter> {
  T get entityType;
}

mixin TypeConverter<T> {
  T convert(dynamic value) => value as T;
}
