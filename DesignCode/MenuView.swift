//
//  MenuView.swift
//  DesignCode
//
//  Created by Nafish 
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack (spacing: 16){
                Text("Meng_28% complete")
                    .font(.caption)
                Color.white
                    .frame(width: 38,height: 6)
                    .cornerRadius(3)
                    .frame(width: 130,height: 6,alignment: .leading)
                    .cornerRadius(3)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .padding()
                    .frame(width: 150,height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign Out", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(color: Color.black.opacity(0.06), radius: 20,x:0,y:20)
            .padding(.horizontal,30)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60,height: 60)
                    .clipShape(Circle())
                    .offset(y:-150)
                
                
            )
        }
        .padding(.bottom,30)
    }
}

#Preview {
    MenuView()
}

struct MenuRow: View {
    var title : String
    var icon : String
    
    
    var body: some View {
        HStack (spacing: 16){
            Image(systemName: icon)
                .font(.system(size: 20,weight: .light))
                .imageScale(.large)
                .frame(width: 32,height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            Text(title)
                .font(.system(size: 20,weight: .bold,design: .default))
                .frame(width: 120,alignment: .leading)
        }
    }
}
