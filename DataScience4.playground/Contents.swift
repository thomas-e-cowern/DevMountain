import UIKit

public class TreeNode<T> {
    
    //MARK: - Properties
    public var value: T
    public var children: [TreeNode] = []
    
    //MARK: - Initializers
    public init(_ value: T) {
        self.value = value
    }
    
    //MARK: - Methods
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    public func forEachBreadthFirst(visit: (TreeNode) -> Void){
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach{ queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach{ queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable{
    public func depthFirstSearch(for value: T) -> TreeNode? {
        var result: TreeNode?
        forEachDepthFirst { (node) in
            print("searching for \(value) : currently at node \(node.value)")
            if node.value == value{
                result = node
            }
        }
        return result
    }
    
    public func breadthFirstSearch(for value: T) -> TreeNode?{
        var result: TreeNode?
        forEachBreadthFirst { (node) in
            print("searching for \(value) : currently at node \(node.value)")
            if node.value == value{
                result = node
            }
        }
        return result
    }
}

// MARK: - Example
func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}


let tree = makeBeverageTree()

//tree.forEachDepthFirst { (node) in
//  print("Now Visiting \(node.value)")
//}

tree.forEachBreadthFirst { (node) in
    print("Now Visiting \(node.value)")
}

tree.breadthFirstSearch(for: "bitter lemon")?.value
