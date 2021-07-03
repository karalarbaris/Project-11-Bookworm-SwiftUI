//
//  RatingView.swift
//  Project-11-Bookworm-SwiftUI
//
//  Created by Baris Karalar on 3.07.2021.
//

import SwiftUI

//Adding a custom star rating component

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        
        HStack {
            Text(label)
            
            ForEach(1..<maximumRating+1) { number in
                Image(systemName: "star.fill")
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
        
    }
    
    func image(for number: Int) -> Image{
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
