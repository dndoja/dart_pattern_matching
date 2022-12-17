mixin Sealed<T extends TypeConverter<dynamic, dynamic>> {
  T get type;
}

mixin TypeConverter<TBase extends Sealed, T extends TBase> {
  T cast(TBase value) => value as T;

  _Runnable<T> using(TBase value) => _Runnable(cast(value));
}

class _Runnable<T> {
  const _Runnable(this.value);
  final T value;

  TReturn run<TReturn>(TReturn Function(T) fn) => fn(value);
}
