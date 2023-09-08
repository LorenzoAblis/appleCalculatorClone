import SwiftUI
import Foundation

final class CalculatorViewModel: ObservableObject {
    @Published var operation: String
    @Published var input1: String
    @Published var input2: String
    
    init() {
        input1 = "0"
        input2 = "0"
        operation = ""
    }
    
    func updateDisplay() -> String {
        return operation.isEmpty ? input1 : input2
    }
    
    func calculate() -> String {
        let (num1, num2) = (Double(input1) ?? 0, Double(input2) ?? 0)
        
        switch operation {
        case "+":
            return String(num1 + num2)
        case "-":
            return String(num1 - num2)
        case "X":
            return String(num1 * num2)
        case "/":
            return String(num1 / num2)
        default:
            return ""
        }
    }
    
    func inputUpdate(input: String) {
        switch input {
        case "+", "-", "X", "/":
            operation = input
        case "AC":
            input1 = "0"
            input2 = "0"
            operation = ""
        case "%":
            if operation.isEmpty {
                input1 = String((Double(input1) ?? 0)/100.0)
            } else {
                input2 = String((Double(input2) ?? 0)/100.0)
            }
        case "+/-":
            if operation.isEmpty {
                input1 = String((Double(input1) ?? 0) * -1.0)
            } else {
                input2 = String((Double(input2) ?? 0) * -1.0)
            }
        case ".":
            if operation.isEmpty {
                if input1.contains(".") {
                    break
                } else {
                    input1 += "."
                }
            } else {
                if input2.contains(".") {
                    break
                } else {
                    input2 += "."
                }
            }
        case "=":
            input1 = calculate()
            input2 = "0"
            operation = ""
        default:            
            if operation.isEmpty {
                input1 == "0" ? (input1 = input) : (input1 += input)
            } else {
                input2 == "0" ? (input2 = input) : (input2 += input)
            }
        }
    }
}
