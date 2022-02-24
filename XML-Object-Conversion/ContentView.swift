//
//  ContentView.swift
//  XML-Object-Conversion
//
//  Created by Jainy Alvin on 2/23/22.
//

import SwiftUI

//var viewmodel : viewModel = viewModel()

struct ContentView: View {
    var viewmodel : viewModel = viewModel()

    var body: some View {
       
        VStack(alignment: .leading)
        {
            
            List {
                ForEach (0..<viewmodel.books.count)
                {
                    index in
                   
                    VStack(alignment: .leading)
                    {
                    Text("Title - " + viewmodel.books[index].bookTitle)
                         Text("Author-" + viewmodel.books[index].bookAuthor)
                    }
                    
         
                }
                
           
            }
            
           
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
