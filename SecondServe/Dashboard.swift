import SwiftUI

struct Dashboard: View {
    @State private var searchFood = ""
    @State private var showCart = false
    
    var body: some View {
        TabView {
            
            // home tab
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
                    
                    // Objects in feed, 1st section
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20) {
                            CardView(title: "Banana", backgroundColor: Color.gray.gradient).frame(width: 180, height: 200)
                            CardView(title: "Orange", backgroundColor: Color.gray.gradient).frame(width: 160, height: 200)
                            CardView(title: "Yogurt", backgroundColor: Color.gray.gradient).frame(width: 160, height: 200)
                            CardView(title: "Milk", backgroundColor: Color.gray.gradient).frame(width: 160, height: 200)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                    }
                    .frame(height: 220)
                    
                    // Objects in feed, 2nd section
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20) {
                            CardView(title: "Pizza", backgroundColor: Color.gray.gradient).frame(width: 180, height: 200)
                            CardView(title: "Chicken", backgroundColor: Color.gray.gradient).frame(width: 160, height: 200)
                            CardView(title: "Pear", backgroundColor: Color.gray.gradient).frame(width: 160, height: 200)
                            CardView(title: "Taco", backgroundColor: Color.gray.gradient).frame(width: 160, height: 200)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                    }
                    .frame(height: 220)
                }
                
                // bottom right cart button
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: { // if pressed
                            showCart = true
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
            .sheet(isPresented: $showCart) { // opens up sheet with order details
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
            .tabItem {  // home tab (leave it like this)
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            
            // sell tab
            Text("Sell").tabItem {
                Image(systemName: "plus")
                Text("Sell")
            }

            // profile tab
            Text("Profile").tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}

// Function that displays items in a Card View template
struct CardView: View {
    let title: String
    let backgroundColor: AnyGradient
    
    var body: some View {
        VStack{
            Text(title).font(.system(size: 30))
        }
        .frame(width: 150.0, height: 100.0)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    Dashboard()
}
