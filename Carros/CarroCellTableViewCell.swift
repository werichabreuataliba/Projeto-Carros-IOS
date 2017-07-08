//
//  CarroCellTableViewCell.swift
//  Carros
//
//  Created by Macbook on 08/05/17.
//  Copyright © 2017 Werich. All rights reserved.
//

import UIKit

class CarroCellTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoCarro: UIImageView!
    
    @IBOutlet weak var labelDescricaoCarro: UILabel!
    @IBOutlet weak var labelTituloCarro: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
