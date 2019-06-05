//
//  ContactsCell.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/10/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//


import UIKit
import Alamofire


class ContactsCell: UITableViewCell {
    
    var contact: ContactsDatabase? {
        didSet{
            identifierLabel.text = "Identificador: \(contact?.identifier ?? "")"
            nameLabel.text = "Nombre: \(contact?.name ?? "")"
            phoneLabel.text = "Teléfono: \(contact?.phone ?? "")"
        }
    }
    
    weak var identifierLabel: UILabel!
    weak var nameLabel: UILabel!
    weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
    
        let identifierLabel = UILabel(frame: .zero)
        identifierLabel.translatesAutoresizingMaskIntoConstraints = false
        identifierLabel.numberOfLines = 0
        self.contentView.addSubview(identifierLabel)
        
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        self.contentView.addSubview(nameLabel)
        
        let phoneLabel = UILabel(frame: .zero)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.numberOfLines = 0
        self.contentView.addSubview(phoneLabel)
        
        NSLayoutConstraint.activate([
            identifierLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor,
                                            constant: 10),
            identifierLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,
                                                constant: 10),
            identifierLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,
                                                 constant: -10),
            nameLabel.topAnchor.constraint(equalTo: identifierLabel.bottomAnchor,
                                            constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,
                                                constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,
                                                 constant: -10),
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                           constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,
                                               constant: 10),
            phoneLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: -10),
            phoneLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,
                                                constant: -10),
            ])
        
        self.identifierLabel = identifierLabel
        self.nameLabel = nameLabel
        self.phoneLabel = phoneLabel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
