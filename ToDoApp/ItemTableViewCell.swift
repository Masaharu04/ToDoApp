//
//  ItemTableViewCell.swift
//  ToDoApp
//
//  Created by 御前政喜 on 2023/09/08.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var markImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title: String, times: String, isMarked: Bool){
        titleLable.text = title
        timeLabel.text = times
        
        if isMarked{
            markImageView.image = UIImage(systemName: "star.fill")
        }else{
            markImageView.image = UIImage(systemName: "star")
        }
            
    }
    
}
