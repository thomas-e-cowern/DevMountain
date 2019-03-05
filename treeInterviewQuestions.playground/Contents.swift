import UIKit

import UIKit

class LinkedListNode {
    let value: Int
    var next: LinkedListNode?
    let countInList: Int
    
    init(value: Int, next: LinkedListNode? = nil, countInList: Int){
        self.value = value
        self.next = next
        self.countInList = countInList
    }
}

private func buildLinkedList(from node: LinkedListNode, in array: [Int]) -> LinkedListNode{
    let nextNodeValue = array[node.value]
    let nextNode = LinkedListNode(value: nextNodeValue, countInList: node.countInList + 1)
    return nextNode.value == -1 ? nextNode : buildLinkedList(from: nextNode, in: array)
}


func getCountOfLinkedList(from array: [Int]) -> Int {
    let headValue = array[0]
    let firstNode = LinkedListNode(value: headValue, countInList: 0)
    let lastNode = buildLinkedList(from: firstNode, in: array)
    return lastNode.countInList + 1
}

let array = [1,4,-1,3,2]

getCountOfLinkedList(from: array)
