//
//  ContentView.swift
//  RestaurantApp
//
//  Created by Febrian on 26/03/24.
//

import SwiftUI

let restaurants: [Restaurant] = [
    Restaurant(id: "rqdv5juczeskfw1e867", name: "Melting Pot", description: "Description One", pictureId: "https://restaurant-api.dicoding.dev/images/medium/14", city: "Medan", rating: 4.2),
    Restaurant(id: "s1knt6za9kkfw1e867", name: "Kafe Kita", description: "Description Two", pictureId: "https://restaurant-api.dicoding.dev/images/medium/25", city: "Gorontalo", rating: 4.0),
    Restaurant(id: "w9pga3s2tubkfw1e867", name: "Bring Your Phone Cafe", description: "Description Three", pictureId: "https://restaurant-api.dicoding.dev/images/medium/03", city: "Surabaya", rating: 4.2),
    Restaurant(id: "uewq1zg2zlskfw1e867", name: "Kafein", description: "Description Four", pictureId: "https://restaurant-api.dicoding.dev/images/medium/15", city: "Aceh", rating: 4.6),
    Restaurant(id: "ygewwl55ktckfw1e867", name: "Istana Emas", description: "Description Five", pictureId: "https://restaurant-api.dicoding.dev/images/medium/05", city: "Balikpapan", rating: 4.5),
    Restaurant(id: "tgkvn13cbzkfw1e867", name: "Pizza Palace", description: "Description Six", pictureId: "https://restaurant-api.dicoding.dev/images/medium/06", city: "Jakarta", rating: 4.7),
      Restaurant(id: "z9w6kn51i5kfw1e867", name: "Burger Barn", description: "Description Seven", pictureId: "https://restaurant-api.dicoding.dev/images/medium/07", city: "Bandung", rating: 4.4),
      Restaurant(id: "s5l2yrc8hvtkfw1e867", name: "Sushi Spot", description: "Description Eight", pictureId: "https://restaurant-api.dicoding.dev/images/medium/08", city: "Yogyakarta", rating: 4.3),
      Restaurant(id: "q2pl6tm92ekfw1e867", name: "Taco Town", description: "Description Nine", pictureId: "https://restaurant-api.dicoding.dev/images/medium/09", city: "Semarang", rating: 4.1),
      Restaurant(id: "m8nd3x4ptmkfw1e867", name: "Diner Delight", description: "Description Ten", pictureId: "https://restaurant-api.dicoding.dev/images/medium/10", city: "Denpasar", rating: 4.6)
]

struct ContentView: View {
    
    var body: some View {
        NavigationView {
        VStack(alignment:.leading){
        
            HStack{
                Text("Restaurants")
                Spacer()
                
                    NavigationLink(destination: ProfileView()) {
                            Image(systemName: "person.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 24))
                    }
                
            }.padding(.horizontal, 24)
           
                List(restaurants) { restaurant in
                    NavigationLink(destination: RestaurantDetailView(restaurant:restaurant)){
                        
                        HStack(alignment:.top) {
                            AsyncImage(url: URL(string: restaurant.pictureId)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                
                            } placeholder: {
                                ProgressView()
                            }.padding(.trailing, 8)
                            
                            
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(restaurant.name).font(.system(size: 14, weight: .bold))
                                Text(restaurant.description).font(.system(size: 12))
                                HStack{
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 12))
                                    Text(String(format: "%.2f", restaurant.rating)).font(.system(size: 12, weight: .semibold))
                                }.padding(.top, 4)
                            }
                            
                        }
                    }.isDetailLink(false)
                }.listStyle(InsetGroupedListStyle())
                
            }
            
        }
    }
}
