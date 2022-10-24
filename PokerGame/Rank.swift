//
//  Rank.swift
//  PokerGame
//
//  Created by So í-hian on 2022/10/24.
//

import Foundation

//牌面數字大小定義
enum Rank: Int, CaseIterable {
    case two = 2
    case three, four, five, six, seven, eight, night, ten
    case jack, queen, king, ace
}

//牌面數字比較
extension Rank: Comparable {
    public static func <(lhs: Rank, rhs: Rank) -> Bool {
        switch (lhs, rhs) {
        case (_, _) where lhs == rhs:
            return false
        case (.ace, _):
            return false
        default:
            return lhs.rawValue < rhs.rawValue
        }
    }
}

//自定義輸出牌面數字
extension Rank: CustomStringConvertible {
    public var description: String {
        switch self {
        case .ace: return "1"
        case .jack: return "11"
        case .queen: return "12"
        case .king: return "13"
        default: return "\(rawValue)"
        }
    }
}
