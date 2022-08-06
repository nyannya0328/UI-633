//
//  MainView.swift
//  UI-633
//
//  Created by nyannyan0328 on 2022/08/06.
//

import SwiftUI
import Lottie

struct MainView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var animatedIcon : [AnimatedIcon] = {
       
        var tabs : [AnimatedIcon] = []
        
        for tab in Tab.allCases{
            
            tabs.append(.init(tabIcon: tab, lottieView: AnimationView(name: tab.rawValue,bundle: .main)))
            
        }
        return tabs
        
    }()
    @State var currentTab : Tab = .home
    @Environment(\.self) var env
    var body: some View {
        VStack(spacing:0){
            
            
            TabView(selection: $currentTab) {
                
                Text("Home")
                    .BG()
                    .tag(Tab.home)
                
                Text("Chat")
                    .BG()
                    .tag(Tab.chat)
                
                Text("SAVE")
                    .BG()
                    .tag(Tab.saved)
                
                Text("USER")
                    .BG()
                    .tag(Tab.account)
                
                Text("Notification")
                    .BG()
                    .tag(Tab.notifications)
                
            }
            
            if #available(iOS 16, *){
                
                
                TabCard()
                    .toolbar(.hidden, for: .tabBar)
                    
                    
            }
            else{
                
                
                TabCard()
                
                
            }
        }
    }
    @ViewBuilder
    func TabCard()->some View{
        
        HStack(spacing:0){
            
            ForEach(animatedIcon){icon in
                
                let tabColor : SwiftUI.Color = currentTab == icon.tabIcon ? (env.colorScheme == .dark ? .white : .black) : .gray.opacity(0.6)
                
                ResizebleLottieView(lottieView: icon.lottieView,color: tabColor)
                    .aspectRatio(contentMode: .fill)
                 .frame(width: 30,height: 30)
                  .frame(maxWidth: .infinity,alignment: .center)
                  .contentShape(Rectangle())
                  .onTapGesture {
                      
                      currentTab = icon.tabIcon
                      icon.lottieView.play{_ in
                          
                      }
                      
                      
                      
                      
                  }
            }
            
        }
        .padding(.vertical,10)
        .padding(.horizontal)
        .background{
         
            (env.colorScheme == .dark ? Color.black : Color.white)
        }
      
        
        
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View{
    @ViewBuilder
    func BG()->some View{
        
        self
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background{
        
                  Color.primary.opacity(0.03)
                      .ignoresSafeArea()

              }
        
        
    }
}
