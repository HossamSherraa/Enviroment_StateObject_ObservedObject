//
//  ContentView.swift
//  Shared
//
//  Created by Hossam on 22/02/2021.
//

import SwiftUI

/*
 
 1- a view called .enviroment("NewValue")
     
 2- a view didn't called enviroment("NewValue")
       if av
 3- a view that will be presented ("NavigatioLink") and when Presented It will change Enviroment
 
 4- a view that will be presented ("@State ISPresented") and when Presented It will change Enviroment
 
 if a view called this function it will be changed in all views that's not called .enviroment()
this mean It will change the value in all views
 
 if view didn't called .enviroment () it will use the default value and listen if this value changed
 
 if the view that will presented if it changes the enviroment , it will be changed in all views that's doesnot called .enviroemnt() and if it removed the value of enviroment will back to its default
if navigation , It will change
 if presented  will note change all values it will change its value and it childs


 */
struct ContentView: View {
    @Environment(\.customeEnviromentKey) var customeKey : String
    @State var isPresented = false
    var body: some View {
        NavigationView{
        VStack{
        Text("Hello, world!")
            .padding()
            
            ChildLevel1()
        
            ChildLevel2()
                .environment(\.customeEnviromentKey, "f")
            
            NavigationLink.init("GoToChild2", destination:
                                    ChildLevel2()
                                    .environment(\.customeEnviromentKey, "chae")

            )
            
            if isPresented {
                ChildLevel2()
                    .environment(\.customeEnviromentKey, "x")
                    .overlay(ChildLevel2()
                                .font(.largeTitle))
            }
            
        }
        .onTapGesture {
           isPresented.toggle()
        }
       
    
        }
        
    }
}

struct ChildLevel1 : View {
    @Environment(\.customeEnviromentKey) var customeKey : String
    var body: some View {
        Text(customeKey)
    }
}

struct ChildLevel2 : View {
    @Environment(\.customeEnviromentKey) var customeKey : String
    var body: some View {
        Text(customeKey)
    }
}


struct CustomeEnviromentKey : EnvironmentKey{
    static var defaultValue: String = "Default"
    
    typealias Value = String
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension EnvironmentValues {
    var customeEnviromentKey : String {
        get {
            CustomeEnviromentKey.defaultValue
        }
        set{
            CustomeEnviromentKey.defaultValue = newValue
        }
    }
}
