import UIKit

class MinHeap<T: Comparable> {
    private var theGoods: [T] = []
    
    private func getLeftChildIndex(for parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    
    private func getRightChildIndex(for parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    
    private func getParentIndex(for childIndex: Int) -> Int {
        return ((childIndex - 1)/2)
    }
    
    private func leftChild(for index: Int) -> T? {
        let leftIndex = getLeftChildIndex(for: index)
        guard leftIndex < theGoods.count else { return nil }
        return theGoods[leftIndex]
    }
    
    private func rightChild(for index: Int) -> T? {
        let rightIndex = getRightChildIndex(for: index)
        guard rightIndex < theGoods.count else { return nil }
        return theGoods[rightIndex]
    }
    
    private func parent(for index: Int) -> T {
        return theGoods[getParentIndex(for: index)]
    }
    
    private func heapafyUp (from index: Int) {
        if parent(for: index) > theGoods[index] {
            let parentIndex = getParentIndex(for: index)
            theGoods.swapAt(index, parentIndex)
            heapafyUp(from: parentIndex)
        }
    }
    
    private func heapafyDown (from index: Int) {
        if let leftChild = leftChild(for: index) {
            var switchIndex: Int!
            if let rightChild = rightChild(for: index) {
                switchIndex = leftChild < rightChild ? getLeftChildIndex(for: index) : getRightChildIndex(for: index)
            } else {
                switchIndex = getLeftChildIndex(for: index)
            }
            guard theGoods[switchIndex] < theGoods[index] else { return }
            theGoods.swapAt(switchIndex, index)
            heapafyDown(from: switchIndex)
        }
    }
}

extension MinHeap {
    public func peek() -> T? {
        return theGoods.first
    }
    
    public func pull() -> T? {
        guard !theGoods.isEmpty else { return nil }
        let item = theGoods.first
        theGoods[0] = theGoods.remove(at: theGoods.count - 1)
        // TODO: Reorder the heap
        heapafyDown(from: 0)
        return item
    }
    
    public func add(_ aGood: T) {
        theGoods.append(aGood)
        // TODO: Reorder the heap
        heapafyUp(from: theGoods.count - 1)
    }
}
