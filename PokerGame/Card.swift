//
//  Card.swift
//  PokerGame
//
//  Created by yixuan on 2022/8/17.
//

import Foundation

//牌面構成
struct Card: Equatable {
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}

//牌面比較
extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank ? lhs.suit < rhs.suit : lhs.rank < rhs.rank
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank ? lhs.suit > rhs.suit : lhs.rank > rhs.rank
    }
}

//自定義輸出卡面名稱
extension Card: CustomStringConvertible {
    var description: String {
        return "\(suit)\(rank)"
    }
}

//牌堆構成
struct Deck {
    private(set) var cards: [Card] = []
    
    init() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
    }
    
    //洗牌用
    mutating func shuffle() {
        cards.shuffle()
    }
    //抽牌用
    mutating func draw(count:Int) -> [Card]? {
        //抽牌條件：牌堆不是空的，且剩下牌堆牌數足夠抽牌
        guard !cards.isEmpty && 1...cards.count ~= count else {return nil}
        
        var drawCards: [Card] = []
        for _ in 0..<count {
            drawCards.append(cards.removeFirst())
        }
        return drawCards
    }
}
