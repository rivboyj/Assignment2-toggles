import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var myColor = Color.blue
    @State private var featureEnabled = true // Define the featureEnabled state property

    var body: some View {
        VStack {
            Text("Counter: \(counter)")
            HStack {
                Button(action: {
                    counter += 1
                    if featureEnabled {
                        myColor = getRandomColor()
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(myColor)
                            .frame(width: 40, height: 40)
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                }
            }

            // Replace the Button with a Toggle
            Toggle(isOn: $featureEnabled) { //the dollar sign binds the state variable so that it can be toggled
                Text("Enable Color Change")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }

    func getRandomColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)//creates random double rgb values and then creates the random color to be returned
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
