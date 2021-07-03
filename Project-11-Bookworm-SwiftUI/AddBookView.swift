//
//  AddBookView.swift
//  Project-11-Bookworm-SwiftUI
//
//  Created by Baris Karalar on 2.07.2021.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                 
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section {
                    
                    RatingView(rating: $rating)
//                    Picker("Rating", selection: $rating) {
//                        ForEach(0..<6) {
//                            Text("\($0)")
//                        }
//                    }
                    
                    TextField("Write a review", text: $review)
                    
                }
                
                Section {
                    Button("Save") {
                        
                        let newBook = Book(context: moc)
                        
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review
                        
                        try? moc.save()
                        presentationMode.wrappedValue.dismiss()
                        
                        
                    }
                }
                
                
            }
            .navigationBarTitle("Add book")
        }
        
        
        
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
