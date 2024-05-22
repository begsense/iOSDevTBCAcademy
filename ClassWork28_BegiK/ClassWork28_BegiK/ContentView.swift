//
//  ContentView.swift
//  ClassWork28_BegiK
//
//  Created by M1 on 22.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        Text("სალამ SwiftUI")
            .font(.largeTitle)
            .padding(7)
        
        HStack(spacing: 13, content: {
            CardView(icon: "cardButtonImage", title: "ჯუზონები სმნ", description: "გიყვარს ჯუზონები??", height: 313, backgroundImage: "cardBackgroundImage", backgroundImageWidth: 82, backgroundImageHeight: 182, backgroundColor: Color(red: 247/255, green: 187/255, blue: 54/255))
            VStack() {
                CardView(icon: "card2ButtonImage", title: "ჩატაობა", description: "", height: 150, backgroundImage: "card2BackgroundImage", backgroundImageWidth: 97, backgroundImageHeight: 93, backgroundColor: Color(red: 255/255, green: 132/255, blue: 75/155))
                CardView(icon: "card3ButtonImage", title: "ცეცხლოვანი სიახლეები", description: "", height: 150, backgroundImage: "card3BackgroundImage", backgroundImageWidth: 66, backgroundImageHeight: 86, backgroundColor: Color(red: 127/255, green: 54/255, blue: 247/155))
            }
        })
    }
    
    struct CardView: View {
        var icon: String
        var title: String
        @State var description: String
        var height: CGFloat = 150
        var backgroundImage: String
        var backgroundImageWidth: CGFloat
        var backgroundImageHeight: CGFloat
        @State var backgroundColor: Color
        var body: some View {
            ZStack() {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(backgroundImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: backgroundImageWidth, height: backgroundImageHeight)
                            .padding(backgroundImage == "card2BackgroundImage" ? -8 : 0)
                    }
                }
                VStack {
                    Spacer()
                    Button(action: {
                        if (icon == "cardButtonImage") {
                            description = "მეც მიყვარს სმნ"
                        } else if (icon == "card2ButtonImage") {
                            backgroundColor = .orange
                        } else {
                            
                        }
                        
                    }) {
                        Image(icon)
                            .resizable()
                            .frame(width: 32, height: 32)
                            .scaledToFill()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                    }
                    Text(title)
                        .font(.custom("FiraGO", size: 13))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 19)
                    Spacer()
                    Spacer()
                    Spacer()
                    Text(description)
                        .font(.custom("SF Pro Display", size: 17))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .frame(width: 165, height: height)
            .background(backgroundColor)
            .cornerRadius(20)
        }
    }
    
    struct ListItemView: View {
        var title: String
        
        var body: some View {
            HStack {
                Image(systemName: "text.book.closed")
                    .foregroundColor(.blue)
                Text(title)
            }
            .padding(.vertical, 5)
        }
    }
}

#Preview {
    ContentView()
}
