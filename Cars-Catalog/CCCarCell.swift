//
//  CCCarCell.swift
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/27/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class CCCarCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
