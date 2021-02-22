//
//  StateObjectVSObervedObject.swift
//  Enviroment_StateObject_ObservedObject (iOS)
//
//  Created by Hossam on 22/02/2021.
//
/*
 1- If you did use @ObservedObject This mean It will save the state of the ViewModel() when view needs to be redrawn
 NOTE :- this view is a child so it built inside a BODY on PARENT View , so when the parent view needs to REDRAW its body doe to State Changed , this will re create new ViewModel
 
 to save state of the model without needs to recreate it everytime the parent view redraws its body  , you have to use @StateObject
 */



import SwiftUI
class ViewModel : ObservableObject {
   @Published var count = 0
}

struct SomeView : View {
    
    @State var isPresented = false
    var body: some View {
        Counter()
            .onLongPressGesture {
                isPresented.toggle()
                print("Toggled")
            }
        if isPresented{
            Text("REDRAWN")
        }
        
            
    }
}

struct Counter : View {
    @StateObject var viewModel = ViewModel()
    var body: some View{
        Text(viewModel.count.description)
            .onTapGesture {
                viewModel.count += 1
            }
    }
    
}
struct SomeView_Preview : PreviewProvider{
    static var previews: some View{
        SomeView()
    }
}
