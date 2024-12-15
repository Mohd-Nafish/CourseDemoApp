//
//  HomeView.swift
//  DesignCode
//
//  Created by Nafish
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system( size: 28,weight:.bold))
                        .modifier(CustomFontModifier(size: 28))
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    Button(action: {self.showUpdate.toggle()}) {
                        Image(systemName: "bell")
                            .renderingMode(.template)
                            .font(.system(size: 16,weight: .medium))
                            .frame(width: 36,height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1 )
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10 )
                        
                    }
                    .sheet(isPresented: $showUpdate){
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.leading,14)
                .padding(.top,30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingViews()
                        .padding(.horizontal,30)
                        .padding(.bottom,30)
                        .onTapGesture {
                            self.showContent=true
                        }
                }
                
                
                ScrollView (.horizontal,showsIndicators: false){
                    HStack(spacing: 20) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(degrees:
                                                                Double(geometry.frame(in: .global).minX - 30) / -20
                                                           ), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 275,height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom,30)
                    
                }
                .offset(y: -30)
                HStack {
                    Text("Courses")
                        .font(.title).bold()
                    Spacer()
                }
                .padding(.leading,30)
                .offset(y: -60)
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                    .offset(y: -60)
                Spacer()
                
            }
        }
    }
}

#Preview {
    HomeView(showProfile: .constant(false), showContent: .constant(false))
}

struct SectionView: View {
    var section: Section
    var width:CGFloat = 275
    var height:CGFloat = 275
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24,weight: .bold))
                    .frame(width: 160,alignment: .leading)
                    .foregroundColor(Color.white)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity,alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top,20)
        .padding(.horizontal,20)
        .frame(width: width,height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20,x:0,y:20)
    }
}

struct Section: Identifiable{
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
    
    
}
let sectionData = [
    Section(title: "Prototype desig in  swiftUI ", text: "18 Sections", logo: "Logo1", image: Image("Card2"), color: Color("card1")),
    Section(title: "Build a swift UI app", text: "20 Sections", logo: "", image: Image("Card4"), color: Color("card2")),
    Section(title: "Prototype desig in  swiftUI ", text: "18 Sections", logo: "Logo1", image: Image("Card3"), color: Color("card3"))
]

struct WatchRingViews: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),color2: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) ,width: 44,height: 44,percent: 68, show: .constant(true))
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left").bold().modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 minutes today").modifier(FontModifier(style: .caption))
                }
                .modifier(FontModifier())
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),color2: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) ,width: 32,height: 32,percent: 54, show: .constant(true))
                
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),color2: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) ,width: 32,height: 32,percent: 32, show: .constant(true))
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShowModifier())
            
        }
    }
}
