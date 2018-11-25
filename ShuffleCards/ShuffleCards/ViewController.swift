//
//  ViewController.swift
//  ShuffleCards
//
//  Created by MB on 11/24/18.
//  Copyright © 2018 MB. All rights reserved.
//
// swift is extremely type specific language
//swift has strong type inference that it will guess a type for you
import UIKit

class ViewController: UIViewController {
    
    //communication from controller to Model
    // lazy it is not initialized until some1 uses it
  private lazy  var game : Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards )
    
    
    //computed read only property
    var numberOfPairsOfCards : Int {
//        get{
//            return (cardButtons.count + 1) / 2
//        }
        
        //read only property can only be return instead of get cant be done for only set
        return (cardButtons.count + 1) / 2
    }
    
    
    //instance variable called property
    private(set) var flipCount  = 0 {
        didSet{
             flipCountLabel.text = "Flips : \(flipCount)"
 //           print(oldValue)
            
         
        }
    }
    
    

    
    @IBOutlet private weak var flipCountLabel: UILabel!
   
    // array of UIButtons
    
    @IBOutlet private var cardButtons : [UIButton]!
    //@IBOutlet var cardButtons: Array<UIButton>!
    
    @IBAction private func touchCard(_ sender: UIButton) {
      
        flipCount += 1
        
        //nil handling if button not found
        if let cardNumber = cardButtons.index(of: sender){
        //print("cardNumber = \(cardNumber)")
        //    flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else{
            print("card not present " )
        }
       
      //  flipCard(withEmoji: "👻", on: sender)
    }

    
    
    
    private func updateViewFromModel(){
        
   //     for index in 0..<cardButtons.count
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp{
                button.setTitle(emoji(for : card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) :  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
            //exits app used for debugger
        //    if (flipCount > Int(arc4random_uniform(UInt32(132)))) {exit(-1)}
        }
    }
    
    // var emojiChoices : Array<String> = ["👻","🎃","🍎","🦇"]
    
    //implicit datatype or type inference
    private var emojiChoices  = ["👻","🎃","🍎","🦇","🍭","🍬","😈","🙀","😱"]
    
  //  var emoji = Dictionary<Int,String>()
    private var emoji = [Int:String]()
    
    
    private func emoji(for card : Card) -> String{
        
        //checing for nil done as String was return as optional as dictionary value can be nil if not present
//        if  emoji[card.identifier] != nil{
//            return emoji[card.identifier]!
//        }
//        else{
//            return "?"
//        }
        
        
        //removing embedded /nested if using ,
        if emoji[card.identifier] == nil , emojiChoices.count > 0{
            
         //   if emojiChoices.count > 0{
                
                
            //generates a random number from 0 to upperbound
            //Type Casting
     //  1)   //  let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            
            // removing element/ emoji selected from emojiChoice         
     //  2)   //  emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
         
            //due to extension we have arc4random code condensed
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
          //  }
        }
        
        //nill coalescing
        return emoji[card.identifier] ?? "?"
    }
    
    
    
    
    
    
//    func flipCard(withEmoji emoji : String,on button:UIButton){
//        print("flipCard emoji is \(emoji)")
//        if button.currentTitle == emoji{
//
//        }
//        else{
//
//        }
//    }

}

extension Int{
    var arc4random : Int{
        if self > 0{
        return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        }
        else{
            return 0
        }
    }
}
