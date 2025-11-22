import SwiftUI

struct Dashboard: View {
    @State private var searchFood = ""
    @State private var showCart = false     // NEW
    
    var body: some View {
        TabView {
            
            // HOME TAB
            ZStack {
                
                ScrollView {
                    VStack(spacing: 20) {
                        TextField("Search", text: $searchFood)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .frame(width: 360, height: 47)

                        Image("PearBanner")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 330, height: 100)
                            .clipped()
                            .cornerRadius(12)
                    }
                    .padding(.top, 24)
                }
                
                // FLOATING CART BUTTON
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            showCart = true      // <-- open cart
                        }) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 20))
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding(.bottom, 30)
                        .padding(.trailing, 20)
                    }
                }
            }
            .sheet(isPresented: $showCart) {
                VStack(spacing: 20) {
                    Text("Your Order")
                        .font(.title)
                        .bold()
                    
                    Text("Your cart is empty!")
                        .foregroundColor(.gray)
                    
                    Button("Close") {
                        showCart = false
                    }
                    .padding()
                }
                .padding()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            
            // OTHER TABS
            Text("Sell").tabItem {
                Image(systemName: "plus")
                Text("Sell")
            }

            Text("Profile").tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}

#Preview {
    Dashboard()
}
