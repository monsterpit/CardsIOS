
import Foundation

class Concentration
{
    private(set) var cards = [Card]()  //empty array init()
    
    private var indexOfOneAndOnlyFaceUpCard : Int?{
        get{
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].isFacedUp {
                    if foundIndex == nil{
                    foundIndex = index
                    }
                    else{
                        return nil
                    }
                }

            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index : Int)
    {
        // assertion to chec for certain condition is true or else it crashes the app
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index) choosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index {
                //chec if cards match
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                
            //    due to computed property
            //    indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                //either no cards or 2 cards are face up
                
                //due to computed property
//                for flipDownIndex in cards.indices{
//                    cards[flipDownIndex].isFacedUp = false
//                }
//                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }

    }
    
    init(numberOfPairsOfCards : Int){
        //default struct initializer
  //      let card = Card(isFacedUp: false, isMatched: false, identifier: <#Int#>)
        
        assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards: \(index) you must atleast have 1 pair of cards ")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
        
//            let matchingCard = card
            //creates a copy of card for macthing card
            
//            cards.append(card)
//            cards.append(matchingCard)
            
            // we can do this also which will also create a copy of card
            //            cards.append(card)
            //            cards.append(card)
            
            cards += [card,card]
            
            
            
        }
        // TODO: Shuffle the Cards
        for index in cards.indices{
          let  randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
         (cards[index],cards[randomIndex]) = (cards[randomIndex],cards[index])
        }
      //  cards.shuffle()
    }
}
