
import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.Flavor.allCases) {
                            $0.displayName
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Special requests", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

extension Order.Flavor {
    var displayName: Text {
        // view concern -> written for the view
        switch self {
        case .vanilla:
            return Text("Vanilla")
        case .chocolate:
            return Text("Chocolate")
        case .strawberry:
            return Text("Strawberry")
            // pattern matching
        case .rainbow:
            return Text("Rainbow")
        }
    }
    
    var forInterpolation: String {
        // view concern -> written for the view
        switch self {
        case .vanilla:
            return "Vanilla"
        case .chocolate:
            return "Chocolate"
        case .strawberry:
            return "Strawberry"
            // pattern matching
        case .rainbow:
            return "Rainbow"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
