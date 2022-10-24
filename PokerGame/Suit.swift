//
//  Suit.swift
//  PokerGame
//
//  Created by So í-hian on 2022/10/24.
//

import Foundation

enum Suit: String, CaseIterable {
    case clubs, diamonds, hearts, spades
}

//花色比較
extension Suit: Comparable {
    public static func < (lhs: Suit, rhs: Suit) -> Bool {
        switch (lhs, rhs) {
        case (_, _) where lhs == rhs:
            return false
        case (.spades, _), (.hearts, .clubs), (.diamonds, .clubs):
            return false
        default:
            return true
        }
    }
}

//自定義輸出花色名稱
extension Suit: CustomStringConvertible {
    public var description: String {
        switch self {
        case .spades: return "spades"
        case .hearts: return "hearts"
        case .diamonds: return "diamonds"
        case .clubs: return "clubs"
        }
    }
}
