
import SwiftUI

struct CircleButton<Destination: View>: View {
    var colorTheme: Color
    var label: String
    var symbol: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: symbol)
                    .font(.system(size: 70))
                    .foregroundColor(colorTheme)
                    .padding(.vertical, 8)
                Text(label)
                    .font(.system(size: 17))
                    .foregroundColor(colorTheme)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
