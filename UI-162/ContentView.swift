//
//  ContentView.swift
//  UI-162
//
//  Created by にゃんにゃん丸 on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            Home()
                
                .navigationTitle("Material TF")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @StateObject var TFModel = TFmanager()
    
    @State var isTapped = false
    var body: some View{
        
       
           
               
            
            VStack{
                
                
               
                    
                    
                    VStack(alignment: .leading, spacing: 4, content: {
                        
                       
                        
                        HStack(spacing:15){
                            
                            TextField("", text: $TFModel.txt) { (stats) in
                                
                                if stats{
                                    
                                    withAnimation(.easeInOut){
                                        
                                        isTapped = true
                                    }
                                }
                                
                            } onCommit: {
                                
                                if TFModel.txt == ""{
                                    
                                    withAnimation(.easeOut){
                                        
                                        isTapped = false
                                    }
                                }
                                
                                
                            }
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "gear")
                                    .foregroundColor(.gray)
                            })
                            
                        }
                        .padding(.top,isTapped ? 15 : 0)
                        .background(
                        
                        
                        Text("USER NAME")
                            .scaleEffect(isTapped ? 0.8 : 1)
                            .offset(x: isTapped ? -7 : 0, y: isTapped ? -15 : 0)
                            .foregroundColor(isTapped ? .accentColor : .gray)
                            
                            
                            ,alignment: .leading
                        )
                        .padding(.horizontal)
                        
                        Rectangle()
                            .fill(isTapped ? Color.accentColor : Color.gray)
                            .frame(height: 1)
                            .opacity(isTapped ? 1 : 0.5)
                            .padding(.top,10)
                            .shadow(color: Color.red, radius: 5, x: 5, y: 5)
                           
                        
                        
                        
                        
                        
                 
                         

                    })
                    .padding(.top,12)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(15)
                
                HStack{
                    
                    Spacer()
                    
                    Text("\(TFModel.txt.count) / 15")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        
                       
                }
             
                
            }
           
           
            .padding()
     
       
        
      
    
        
    
        
        
        
    }
    
}

class TFmanager : ObservableObject{
    
    @Published var txt = ""{
        
        didSet{
            
            
            if txt.count > 15 && oldValue.count <= 15{
                
                txt = oldValue
                
            }
        }
        
    }
}
