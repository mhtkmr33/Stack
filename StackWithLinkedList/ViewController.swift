import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let stackObject = Stack<String>()
        stackObject.push(value: "K")
        stackObject.push(value: "C")
        stackObject.push(value: "A")
        stackObject.push(value: "T")
        stackObject.push(value: "S")
        stackObject.displayStackElements()// S T A C K
        stackObject.pop() // S
        stackObject.displayStackElements() // T A C K
        stackObject.peek() // T
    }
}

class Node<T> {
    var value: T
    var next: Node<T>?
    init(value: T, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

class Stack<T> {
    
    var head: Node<T>?

    func push(value: T) {
        let newNode = Node(value: value, next: nil)
        if head == nil {
            head = newNode
            return
        }
        let currentHead = head
        head = newNode
        head?.next = currentHead
    }
    
    func pop() {
        print(head?.value ?? "Nothing in stack")
        head = head?.next
    }
    
    func displayStackElements() {
        var current = head
        while current?.next != nil {
            print(current?.value ?? "Nothing is here")
            current = current?.next
        }
        print(current?.value ?? "Nothing is here")
    }

    func peek() {
        print(head?.value ?? "No value is head")
    }
    
}
