
import Foundation

/*
 Sequence Protocols Inheritance
 
 Sequence
 |_ Collection
   |_ BidirectionalCollection
     |_ RandomAccessCollection
 
 Complexity
 
 - `reversed()`: ReversedCollection type is O(1) if the collection conforms to `BidirectionalCollection`;
   otherwise, O(n), where n is the length of the sequence.
 - `prefix()`: O(1) if the collection conforms to `RandomAccessCollection`;
   otherwise, O(k), where k is the number of elements to select from the beginning of the collection.
 - `count`: O(1) if the collection conforms to `RandomAccessCollection`; otherwise, O(n), where n is the length of the collection.
*/

// MARK: Examples

/// Collection, must provide implementation for:
/// - Comparable index type
/// - startIndex
/// - endIndex
/// - index(after:)
/// - subscript operator
struct SlowCollection: Collection {
    typealias Index = Int
    
    var startIndex: Index { return 1 }
    var endIndex: Index { return 10 }
    
    func index(after i: Index) -> Index { return i + 1 }
    
    subscript (index: Index) -> String {
        print("subscript", index)
        return String(describing: index)
    }
}

/// BidirectionalCollection, must provide implementation for:
/// - Comparable index type
/// - startIndex
/// - endIndex
/// - index(after:)
/// - index(before:)
/// - subscript operator
struct OkCollection: BidirectionalCollection {
    typealias Index = Int
    
    var startIndex: Index { return 1 }
    var endIndex: Index { return 10 }

    func index(after i: Index) -> Index { return i + 1 }
    func index(before i: Index) -> Index { return i - 1 }
    
    subscript (index: Index) -> String {
      print("subscript", index)
      return String(describing: index)
    }
}

/// Note: in order to meet the complexity guarantees O(1) of a random-access collection,
/// either the index for your custom type must conform to the
/// `Strideable` protocol or you must implement the `index(_:offsetBy:)` and
/// `distance(from:to:)` methods.
/// P.S `Int` subtype conforms to the `Strideable` protocol.
struct QuickCollection: RandomAccessCollection {
    typealias Index = Int
    
    var startIndex: Index { return 1 }
    var endIndex: Index { return 10 }
    
    subscript (index: Index) -> String {
        print("subscript", index)
        return String(describing: index)
    }
}

// MARK: Testing 🧪

print("--- Collection ----")

let collection: [String] = SlowCollection().reversed()
collection.prefix(2).map { print($0) }

print("--- BidirectionalCollection ----")

let bidirectionalCollection: ReversedCollection<OkCollection> = OkCollection().reversed()
bidirectionalCollection.prefix(2).map { print($0) }

print("--- RandomAccessCollection ----")

let randomAccessCollection: ReversedCollection<QuickCollection> = QuickCollection().reversed()
randomAccessCollection.prefix(2).map { print($0) }
