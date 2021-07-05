//
//  DetailView.swift
//  Project-11-Bookworm-SwiftUI
//
//  Created by Baris Karalar on 5.07.2021.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    let book: Book
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(book.genre ?? "Fantasy")
                        .frame(width: geo.size.width)
                    
                    Text(book.genre?.uppercased() ?? "Fantasy")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                
                Text(book.author ?? "No author")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(book.review ?? "No review")
                   .padding()
                
                RatingView(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
                
                Spacer()
                
            }
            
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static let mocc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    
    static var previews: some View {
        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."
        return
            NavigationView {
                DetailView(book: book)
            }
    }
}
