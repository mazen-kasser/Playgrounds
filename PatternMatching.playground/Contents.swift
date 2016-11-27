
    enum Item {
        case Example(value: Int)
        case `Type`(value: Int)
    }

    var collection = [
        Item.Example(value: 5),
        Item.Example(value: 11)
    ]

    // Swift 1
    case .MyCase(let value) where value > 10:

    if let myOptional = myOptional where myOptional > 10 {
        // ...
    }

    // Swift 2 - if case
    if case .iOS(let language) = platform where language == "Swift" {

    }

    // Swift 1
    for item in collection {
        switch item {
        case .Example(let value):
            if value > 10 {
                ///...
            }
        }
    }

    // Swift 2 - simple case matching with associated value and a conditional
    for case let .Example(value) in collection where value > 10 {
        ///...
    }
