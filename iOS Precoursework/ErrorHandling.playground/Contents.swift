import UIKit

//var str = "Hello, playground"

enum Token {
    case number(Int)
    case plus
    case minus
}

class Lexer {
    
    enum Error: Swift.Error {
        case invalidCharacter(Character)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past EndIndex!")
        position = input.index(after: position)
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                // Start of a number - need to grab the restlet value = getNumber()let value = getNumber()
                let value = getNumber()
                tokens.append(.number(value))
                
            case "+":
                tokens.append(.plus)
                advance()
                
            case "-":
                tokens.append(.minus)
                advance()
                
            case " ":
                // Just advance to ignore spaces
                advance()
                
            default:
                if input.contains(nextCharacter) {
                    var result = nextCharacter.unicodeScalars
                    print(result)
                }// Something unexpected - need to send back an error
                
                
                throw Lexer.Error.invalidCharacter(nextCharacter)
                
            }
        }
        
        return tokens
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                // Another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
                
            default:
                // A nondigit - go back to regular lexing
                return value
            }
        }
        
        return value
    }
   
}

func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
        
    } catch Lexer.Error.invalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        print("An error occurred: \(error)")
    }
}




class Parser {
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Parser.Error.unexpectedEndOfInput
        }
        
        switch token {
        case .number(let value):
            return value
        case .plus:
            throw Parser.Error.invalidToken(token)
        case .minus:
            throw Parser.Error.invalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
                
            // Getting a plus after a number is legal
            case .plus:
                // After a plus, we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
                
            case .minus:
                // After a minus, we must get another number
                let nextNumber = try getNumber()
                value -= nextNumber
                
            // Getting a number after a number is not legal
            case .number:
                throw Parser.Error.invalidToken(token)
            }
        }
        
        return value
    }
}

evaluate("1 + 2 + abcdefg")
evaluate("10 + 3 + 5")
evaluate("10 + 5 - 3 - 1")
