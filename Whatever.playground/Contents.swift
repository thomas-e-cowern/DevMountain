import UIKit

public indirect enum BinaryTreeNode<T> {
    case node(BinaryTreeNode<T>, T, BinaryTreeNode<T>)
    case empty
    
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

extension BinaryTreeNode: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value \(value), left = [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}

extension BinaryTreeNode where T: Comparable {
    public mutating func insert(_ value: T) {
        switch self {
        case .node(var left, let currentValue, var right):
            if value < currentValue {
                left.insert(value)
            } else {
                right.insert(value)
            }
        case .empty:
            self = BinaryTreeNode.node(.empty, value, .empty)
        }
    }
}

var sixteenNode = BinaryTreeNode.node(.empty, 16, .empty)
var oneNode = BinaryTreeNode.node(.empty, 1, .empty )
var fourNode = BinaryTreeNode.node(oneNode, 4, sixteenNode)
var twentyFourNode = BinaryTreeNode.node(.empty, 24, .empty)
var rootNode = BinaryTreeNode.node(fourNode, 17, twentyFourNode)

rootNode.count
rootNode.description

rootNode.insert(19)
rootNode.insert(26)
