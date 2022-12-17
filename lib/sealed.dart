mixin Sealed<T extends TypeConverter<dynamic, dynamic>> {
  T get type;
}

mixin TypeConverter<TBase extends Sealed, T extends TBase> {
  T cast(TBase val) => val as T;

  T operator <<(TBase val) => cast(val);

  Runnable<TResult, T> using<TResult>(TBase val) => (fn) => fn.call(cast(val));
}

typedef Runnable<TResult, T> = TResult Function(TResult Function(T value));
