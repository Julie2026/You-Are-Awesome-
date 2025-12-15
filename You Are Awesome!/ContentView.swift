//
//  ContentView.swift
//  I am Awesome
// Hello!!!!
//  Created by VERA, JULIE on 11/5/25.
//
//DRY- Dont repeat yourself

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = 0
    @State private var lastImageNumber = 0
    @State private var lastSoundNumber = 0
    @State private var audioPlayer : AVAudioPlayer!
    @State private var soundIsOn = true
    let numberofImages = 10
    let numberofSounds = 6
    
    
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
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 60))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
        }
        
        HStack {
            Text("Sound On:")
            Toggle("", isOn: $soundIsOn)
                .labelsHidden()
                .onChange(of: soundIsOn){
                    if audioPlayer != nil && audioPlayer.isPlaying {
                        audioPlayer.stop()
                    }
                }
            
                .border(.blue)
            
            Spacer()
            
            Button("Show Message"){
                let messages = ["You are Awesome!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You are Great!",
                                "Fabulous? That's You!",
                                "You Are Fantastic",
                                "Gadzooks my friend! I am astonished at how utterly magnificent you are!"]
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                message = messages[lastMessageNumber]
                
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberofImages-1)
                imageName = "image\(lastImageNumber)"
                
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberofSounds-1)
                if soundIsOn {
                    playSound(soundName: "sound\(lastSoundNumber)")
                }
            }
            
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            .padding()
        }
    }
    
    
    func playSound(soundName: String){
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {print("😡Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
    func nonRepeatingRandom (lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
}

#Preview {
    ContentView()
}
