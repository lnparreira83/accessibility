//
//  ContentView.swift
//  Accessibility
//
//  Created by Lucas Parreira on 21/04/21.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
            "ales-krivec-15949",
            "galina-n-189483",
            "kevin-horstmann-141705",
            "nicolas-tissot-335096"
        ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    @State private var estimate = 0.25
    
    var body: some View {
        
        NavigationView{
            VStack{
            Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .accessibility(label: Text(labels[selectedPicture]))
            .accessibility(addTraits: .isButton)
            .accessibility(removeTraits: .isImage)
            .onTapGesture {
                self.selectedPicture = Int.random(in: 0...3)
                    
               }
        VStack {
            Text("Your score is")
            Text("\(estimate)")
                .font(.title)
            Slider(value: $estimate, in: 0...100)
                .padding()
                .accessibility(value: Text("\(Int(estimate))"))
        }
        .accessibilityElement(children: .ignore)
        .accessibility(label: Text("Your score is 1000"))
            
          }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
