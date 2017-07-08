//
//  XMLCarroParser.swift
//  Carros
//
//  Created by Macbook on 06/05/17.
//  Copyright © 2017 Werich. All rights reserved.
//

import Foundation
class XMLCarroParser :NSObject, XMLParserDelegate{
    
    var carros : Array<Carro> = []
    var tempString: String = ""
    var carro : Carro?
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if("carro" == elementName)
        {
            carro = Carro()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if "carros" == elementName{
            return
        }
        if "carro" == elementName{
            self.carros.append(carro!)
            carro = nil
            return
        }
        if carro != nil{
            if "nome" == elementName
            {
                carro!.nome = tempString
            }
            else if "desc" == elementName{
                carro!.desc = tempString
            }
           else if "url_foto" == elementName{
                carro!.url_foto = tempString
            }
           else if "url_info" == elementName{
                carro!.url_info = tempString
            }
           else if "url_video" == elementName{
                carro!.url_video = tempString
            }
           else if "latitude" == elementName{
                carro!.latitude =  tempString
            }
           else if "longitude" == elementName{
                carro!.longitude = tempString
            }
            tempString = ""
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        tempString += string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
