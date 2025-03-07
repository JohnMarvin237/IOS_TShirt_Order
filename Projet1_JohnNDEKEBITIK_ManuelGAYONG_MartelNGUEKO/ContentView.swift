//
//  ContentView.swift
//  Projet1_JohnNDEKEBITIK_ManuelGAYONG_MartelNGUEKO
//
// Created by John Marvin NDEKEBITIK HELIANG (2722513 - Groupe 0040) - Manuel Luther WONDA GAYONG LONKENG (2722618 - Groupe 0040) - Martel NGUEKO WOLACHE (2718241 - Groupe 0040) on 2025-02-10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var title: String = "Personnalise ton T-shirt !"
    @State private var tshirtSize: CGFloat = 100
    @State private var selectedColor: Color = .blue
    @State private var selectedColorName: String = "Bleu"
    @State private var selectedEmoji: String = "smiley.fill"
    @State private var selectedEmojiColor: Color = .yellow
    @State private var selectedEmojiColorName: String = "Jaune"
    @State private var showConfirmation = false
    
    let colors: [(Color, String)] = [(Color.black, "Noir"), (Color.red, "Rouge"), (Color.blue, "Bleu"), (Color.green, "Vert"), (Color.yellow, "Jaune"), (Color.purple, "Violet")]
    let emojis = ["smiley.fill", "star.fill", "heart.fill", "leaf.fill"]
    
    var sizeLabel: String {
        switch tshirtSize {
        case 50:
            return "Petit"
        case 100:
            return "Moyen"
        case 150:
            return "Grand"
        default:
            return ""
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.blue)
                
            // L'image du t-shirt ne perturbe pas la mise en page
            ZStack {
                Image(systemName:"tshirt.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: tshirtSize * 2, height: tshirtSize * 2)
                    .foregroundColor(selectedColor)
                    
                Image(systemName: selectedEmoji)
                    .resizable()
                    .scaledToFit()
                    .frame(width: tshirtSize / 2, height: tshirtSize / 2)
                    .foregroundColor(selectedEmojiColor)
            }
            .frame(maxWidth: .infinity, maxHeight: 300)  // Fixe la hauteur de la zone contenant le t-shirt
            
            Stepper("Taille :  \(sizeLabel)", value: $tshirtSize, in: 50...150, step: 50)
            
            // Les autres éléments de l'interface restent fixes
            VStack {
                HStack {
                    Text("Couleur du T-shirt")
                    Spacer()
                    Picker("Couleur du T-Shirt", selection: $selectedColorName) {
                        ForEach(colors, id: \.1) { color, name in
                            Text(name).tag(name)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: selectedColorName) { newValue in
                        selectedColor = colors.first(where: { $0.1 == newValue })?.0 ?? .blue
                    }
                }
                
                HStack {
                    Text("Logo du T-shirt")
                    Spacer()
                    Picker("Logo", selection: $selectedEmoji) {
                        ForEach(emojis, id: \.self) { emoji in
                            Image(systemName: emoji)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                HStack {
                    Text("Couleur de l'impression")
                    Spacer()
                    Picker("Couleur du Logo", selection: $selectedEmojiColorName) {
                        ForEach(colors, id: \.1) { color, name in
                            Text(name).tag(name)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: selectedEmojiColorName) { newValue in
                        selectedEmojiColor = colors.first(where: { $0.1 == newValue })?.0 ?? .black
                    }
                }
                
                if showConfirmation {
                    Text("C'est en route ! 🚀")
                        .foregroundColor(.red)
                        .bold()
                }
                
                Button(showConfirmation ? "👍🏾 Commande" : "Commander" ) {
                    showConfirmation = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(showConfirmation ? Color.gray : Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .disabled(showConfirmation)
                .padding(.horizontal, 20)
            }
            .padding(.top, 10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
