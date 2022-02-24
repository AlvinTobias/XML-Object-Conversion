//
//  ViewModel.swift
//  XML-Object-Conversion
//
//  Created by Jainy Alvin on 2/23/22.
//

import Foundation
class viewModel : NSObject, XMLParserDelegate ,ObservableObject {
    
    @Published var books: [Book] = []
    var elementName: String = String()
    var bookTitle = String()
    var bookAuthor = String()
    
    override init()
        {
            super.init()
            convertXMLObject()
        }
    
    func convertXMLObject()
    {
        
        //Get the bundlepath
        let Path = Bundle.main.path(forResource: "XmlInfo", ofType: "xml")
        
        guard Path != nil else
        {
            return
        }
        //Get the URL PAth
        let urlPath = URL.init(fileURLWithPath: Path!)
        
        if let parser = XMLParser(contentsOf: urlPath) {
                   parser.delegate = self
                   parser.parse()
            
               }
        
        
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        if elementName == "book" {
                bookTitle = String()
                bookAuthor = String()
            }

            self.elementName = elementName
        
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if elementName == "book" {
                let book = Book(bookTitle: bookTitle, bookAuthor: bookAuthor)
                books.append(book)
            }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

            if (!data.isEmpty) {
                if self.elementName == "title" {
                    bookTitle += data
                } else if self.elementName == "author" {
                    bookAuthor += data
                }
            }
    }
    
    
}

struct Book
{
    var bookTitle: String
        var bookAuthor: String
}
