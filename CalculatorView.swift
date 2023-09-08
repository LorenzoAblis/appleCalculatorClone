import SwiftUI

struct CalculatorView: View {
    @ObservedObject private var Calculator = CalculatorViewModel()
    private let buttons = [["AC", "+/-", "%", "/"],
                           ["7", "8", "9", "X"],
                           ["4", "5", "6", "-"],
                           ["1", "2", "3", "+"],
                           ["0", ".", "="]]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("\(Calculator.updateDisplay())")
                    .frame(width:300, height: 50, alignment: .trailing)
                    .font(.system(size:75))
                    .foregroundColor(.white)
                    .padding()
                ForEach(buttons, id:\.self) { row in
                    HStack(spacing: 13) {
                        ForEach(row, id:\.self) { button in
                            switch button {
                            case "+", "-", "X", "/":
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                }) {
                                    Text(button)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(Calculator.operation == button ? .orange : .white)
                                        .font(.system(size: 30))
                                        .background(Calculator.operation == button ? .white : .orange)
                                        .clipShape(Circle())
                                }
                            case "=":
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                }) {
                                    Text(button)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                        .background(.orange)
                                        .clipShape(Circle())
                                }
                            case "AC", "+/-", "%":
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                }) {
                                    Text(button)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(.black)
                                        .font(.system(size: 30))
                                        .background(Color(uiColor: .lightGray))
                                        .clipShape(Circle())
                                }
                            case "0":
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                }) {
                                    Text(button)
                                        .padding(28)
                                        .frame(width: 163, height: 75, alignment: .leading)
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                        .background(Color(uiColor: .darkGray))
                                        .clipShape(Capsule())
                                }
                            default:
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                }) {
                                    Text(button)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                        .background(Color(uiColor: .darkGray))
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
