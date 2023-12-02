# Ranges

[Ranges][range] represent an interval between two values.
The most common types that support ranges are `Int`, `Character`, `Date`, and `String`.
They can be used for many things like quickly creating a collection, slicing arrays, checking if a value is in a range, and looping.
They are created using the range operator `...` or `..<` (inclusive and exclusive, respectively).

```swift
1...5 // A range containing 1..5
1..<5 // A range containing 1..<5
```

The reason for having two range operators is to allow to create ranges that are inclusive or exclusive of the end value, which can be useful when for example working with indexes that are zero based.

~~~~exercism/note
When creating a range in Swift using the range operators `...` or `..<`, and wanting to call a method on the range, you need to wrap the range in parentheses.
This is because the otherwise will the method be called on the 2nd argument of the range operator.

```swift
(1...5).contains(5) // Returns true
1...5.contains(5)   // Raises Error: value of type 'Int' has no member 'contains'
```
~~~~

## Contains

If you want to check if a value is in a range, you can use the [`contains`][contains] method.
It returns `true` if the value is in the range, otherwise `false`.

```swift
(1...5).contains(5) // Returns true
(1...5).contains(6) // Returns false
```

## Construct an array from a range

A range can be used to construct an array.
This can be handy when you want to, for example, create an array of numbers.
To construct an array from a range, you can use the [array constructor][array-init] with the range as the argument.

```swift
Array(1...5) // Returns [1, 2, 3, 4, 5]
```

## Get slice of an array

A range can be used to get a slice of an array.
This can be handy when you want to, for example, get the first 5 elements of an array.

```swift
[1, 2, 3, 4, 5][0...4] // Returns [1, 2, 3, 4, 5]
```

## Endless & Beginningless ranges

A range can be endless and beginless.
Using beginless and endless ranges is useful when you want to, for example, slice a string from the beginning or to the end.

```swift
[1, 2, 3, 4, 5][...3] // Returns [1, 2, 3, 4]
[1, 2, 3, 4, 5][3...] // Returns [4, 5]
```

~~~~exercism/caution
If not used on a collection, the endless range can cause an endless sequence, if not used with caution.
~~~~

## Explicit type annotation

If you want to create a range with a type other than `Int`, you need to explicitly annotate the type of the range.
There are two main types of ranges, open and closed ranges.
The half open range type (`..<`) is `Range` and the closed range type (`...`) is `ClosedRange`. 

```swift
let range: ClosedRange<Int> = 1...5
let range2: Range<Int> = 1..<3
```

## Character/String ranges

Ranges can be used to create a range of characters or strings.
This can be handy if you want to check if a character or string is in a range.

```swift
"a"..."z"                 // Returns "a"..."z"
("a"..."z").contains("b") // Returns true
```

[range]: https://developer.apple.com/documentation/swift/range
[contains]: https://developer.apple.com/documentation/swift/range/contains(_:)
[array-init]: https://developer.apple.com/documentation/swift/array/init(_:)-236cl
