//
//  UpdateList.swift
//  DesignCode
//
//  Created by Nafish 
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate(){
        store.updates.append(update(image: "Card1", title: "New Item", text: "Text", date: "Jan 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetails(update: update)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80,height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing,4)
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20,weight: .bold))
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical,8)
                        
                    }
                }
                .onDelete{index in
                    self.store.updates.remove(at: index.first!)
                    
                }
                .onMove{ (source: IndexSet,destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("Add Update")
            },trailing: EditButton())
        }
    }
}
struct update: Identifiable{
    var id = UUID()
    var image: String
    var title: String
    var text : String
    var date: String
}
let updateData = [ update(image: "Card1", title: "SwoftUI Advanced", text: "Take your SwiftUI app to the App strore with advanced techniques like API data, packages and CMS.",date: "Jan 1"),
                   update(image: "Card2", title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS.", date: "OCT 17"),
                   update(image: "Card3", title: "ProtoPie", text: "Quickly ProtoPie advanced animation and interaction for mobile and web. ", date: "Aug 27"),
                   update(image: "Card4", title: "SwiftUI", text: "Learn how to code custome UI, animation, gesture and components in Xcode 11", date: "June 26"),
                   update(image: "Card5", title: "Framer Playground", text: "Create powerfull animation and interaction with Framer X code editior", date: "Jun 11")
]

#Preview {
    UpdateList()
}
