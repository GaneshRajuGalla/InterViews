//
//  ContentView.swift
//  Charcters
//
//  Created by Ganesh on 09/11/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var viewModel = CharctersViewModel()
    
    
    // MARK: - Body
    var body: some View {
        GeometryReader(content: { geometry in
            List {
                ForEach(viewModel.characters ?? [], id: \.id){ charcter in
                    HStack{
                        AsyncImage(url: .init(string: charcter.image ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipped()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                //.frame(height:300)
                                //.frame(width:.infinity)
                        } placeholder: {
                            ProgressView()
                        }
                        Spacer()
                        VStack(alignment: .leading,spacing: 20){
                            Text(charcter.name ?? "")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(charcter.status ?? "")
                                .font(.subheadline)
                                .fontWeight(.light)
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                }
            }
            .listStyle(.plain)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        })
        .task {
            await viewModel.getCharacters()
        }
    }
}

#Preview {
    ContentView()
}
