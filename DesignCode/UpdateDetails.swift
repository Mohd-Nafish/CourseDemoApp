//
//  UpdateDetails.swift
//  DesignCode
//
//  Created by Nafish 
//

import SwiftUI

struct UpdateDetails: View {
    var update: update = updateData[1]
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(DefaultListStyle())
    }
}

#Preview {
    UpdateDetails()
}
