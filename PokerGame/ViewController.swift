//
//  ViewController.swift
//  PokerGame
//
//  Created by yixuan on 2022/8/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var cardImageView: [UIImageView]!
    
    var deck = Deck()
    var winCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playGame(_ sender: Any) {
        //牌堆洗牌
        deck.shuffle()
        
        //電腦從牌堆抽牌
        let computersCard = deck.draw(count: 1)!
        cardImageView[0].image = UIImage(named: "\(computersCard[0])")
        
        //玩家從牌堆抽牌
        let playersCard = deck.draw(count: 1)!
        cardImageView[1].image = UIImage(named: "\(playersCard[0])")
        print("\(computersCard[0]), \(playersCard[0])")
        
        
        //比大小
        if computersCard[0] < playersCard[0] {
            resultLabel.text = "You Win"
            winCount += 1
        } else {
            resultLabel.text = "You Lose"
        }
        
        if deck.cards.isEmpty == true {
            let controller = UIAlertController(title: "牌抽光了，你贏了\(winCount)/26次", message: "按確定重新開始", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確定", style: .default) { _ in
                self.deck = Deck()
                self.winCount = 0
            }
            
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
        }
    }
}

