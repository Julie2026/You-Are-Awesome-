//
//  ContentView.swift
//  I am Awesome
// Hello!!!!
//  Created by VERA, JULIE on 11/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = 0
    @State private var lastImageNumber = 0
    
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeIn(duration: 0.15), value: message)

            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 60))
                .shadow(radius: 30)
                .animation(.default, value: imageName)

        }
        Spacer()
        
        Button("Show Message"){
            let messages = ["You are Awesome!",
                            "When the Genius Bar Needs Help, They Call You!",
                            "You are Great!",
                            "Fabulous? That's You!",
                            "You Are Fantastic",
                            "Gadzooks my friend! I am astonished at how utterly magnificent you are!"]
            var messageNumber = Int.random(in: 0...messages.count-1)
            repeat {
                messageNumber = Int.random(in: 0...messages.count-1)
            } while messageNumber == lastMessageNumber
            message = messages[messageNumber]
            lastMessageNumber = messageNumber
            
            var imageNumber = Int.random(in: 0...9)
            repeat {
                    imageNumber = Int.random(in: 0...9)
            } while imageNumber == lastImageNumber
            
            imageName = "image\(imageNumber)"
            lastImageNumber = imageNumber
        }
        
        .buttonStyle(.borderedProminent)
        .font(.title2)
        
        .padding()
    }
}

#Preview {
    ContentView()
}
