//
//  RestaurantDetailView.swift
//  RestaurantApp
//
//  Created by Febrian on 26/03/24.
//

import Foundation
import SwiftUI

struct RestaurantDetailView: View {
    var restaurant:  Restaurant = restaurants[0]
    
    var body:some View{
        ScrollView {
            VStack(alignment:.leading) {
                AsyncImage(url: URL(string: restaurant.pictureId)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.size.width - 24, height: UIScreen.main.bounds.size.height / 4, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    
                } placeholder: {
                    ProgressView()
                }
                
                Text(restaurant.name)
                    .font(.system(size: 16, weight: .bold))
                    
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 12))
                    Text(String(format: "%.2f", restaurant.rating)).font(.system(size: 12, weight: .semibold))
                }.padding(.top, 4)
                
                HStack{
                    Image(systemName: "location.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                    Text(restaurant.city).font(.system(size: 12, weight: .semibold))
                }.padding(.top, 2)
                
                Text("Description")
                    .font(.system(size: 14, weight: .semibold)).padding(.top, 4)
                
                Text(restaurant.description)
                    .font(.system(size: 12))
                
                Spacer()
            }
        }
    
    }
}
