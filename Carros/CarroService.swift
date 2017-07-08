//
//  CarroService.swift
//  Carros
//
//  Created by Macbook on 06/05/17.
//  Copyright © 2017 Werich. All rights reserved.
//

import Foundation
class CarroService {
    
    class func getCarrosByTipoFromFile(tipo:String)-> Array<Carro>{
        let file = "carros_" + tipo
        let path = Bundle.main.path(forResource: file, ofType: "xml")!
        let data = NSData(contentsOfFile: path)!
        if data.length == 0{
            print("NSData vazio")
            return[]
        }
        let carros = parserXML_SAX(data: data)
        return carros
        
    }
    
    class func parserXML_SAX(data : NSData) -> Array<Carro>{
        if(data.length == 0)
        {
            return[]
        }
        var carros : Array<Carro> = []
        let xmlParser = XMLParser(data: data as Data)
        let carrosParser = XMLCarroParser()
        xmlParser.delegate = carrosParser
        let ok = xmlParser.parse()
        
        if ok{
            carros = carrosParser.carros
            let count = carros.count
            print("Parser, encontrado \(count) carros")
            
        }
        else{
            print("Erro no parser")
        }
        return carros
    }
}
