
import Foundation

//difference between structs and class
// struct no inheritance // so litte simplier than class
// struct are value type and class are reference type
//value type (gets copied)
// reference type .the things live in the heap you got pointers to it when you pass it around you are not passing the thing around you are just pointer around to it . so might have whole bunch of code that has pointers to the same object

//you cant avoid structs in iOS

//in swift when it passes structs is doesnt copy all the bits of all the things of the array when you pass it .It passes it in a way so it only has to mae copies actual copies when someone modifies it  this is called copy on write semantics and thats the way swift implements these value types so structs are value types
//array ,int , dict, strings are struct

struct Card
{
    var isFacedUp = false
    var isMatched = false
    
    var identifier : Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
        
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        
    }
    
}
