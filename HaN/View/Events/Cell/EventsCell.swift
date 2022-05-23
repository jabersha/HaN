//
//  EventsCell.swift
//  HaN
//
//  Created by Jaber Shamali on 22/05/22.
//

import Foundation
import UIKit

final class EventsCell: UITableViewCell{
    static let identifier = "cell"
    
    lazy var dataHoraLb : UILabel = {
        let lb = UILabel(frame: .zero)
        
        return lb
    }()
    
    lazy var clienteLb : UILabel = {
        let lb = UILabel(frame: .zero)
        return lb
    }()
    
    lazy var enderecoLb : UILabel = {
        let lb = UILabel(frame: .zero)
        
        return lb
    }()
    
    lazy var pedidoLb : UILabel = {
        let lb = UILabel(frame: .zero)
        lb.numberOfLines = 0
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var obsLb : UILabel = {
        let lb = UILabel(frame: .zero)
        lb.numberOfLines = 0
        lb.textAlignment = .left
        return lb
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventsCell: CodeView{
    func buildHierarchy() {
        contentView.addSubview(dataHoraLb)
        contentView.addSubview(clienteLb)
        contentView.addSubview(enderecoLb)
        contentView.addSubview(pedidoLb)
        contentView.addSubview(obsLb)
    }

    
    func configConstraints() {
        
        dataHoraLb.snp.makeConstraints{ make in
            make.top.left.equalToSuperview().inset(15)
            make.height.equalTo(30)
            
            
        }
        
        clienteLb.snp.makeConstraints{ make in
            make.centerY.equalTo(dataHoraLb)
            make.left.equalTo(dataHoraLb.snp.right).offset(15)
            make.height.equalTo(30)

            
        }
        
        enderecoLb.snp.makeConstraints{ make in
            make.top.equalTo(dataHoraLb).offset(20)
            make.right.left.equalToSuperview().inset(15).offset(15)
            make.height.equalTo(30)

            
        }
        
        pedidoLb.snp.makeConstraints{ make in
            make.top.equalTo(enderecoLb.snp.bottom)
            make.left.right.equalToSuperview().inset(15).offset(15)

            
        }
        
        obsLb.snp.makeConstraints{ make in
            make.top.equalTo(pedidoLb.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(15).offset(15)
            make.bottom.equalToSuperview().inset(15)


        }
        
        
    }
    
    func additionalConfig() {
        dataHoraLb.text = "01/02 18:30"
        clienteLb.text = "Jaber Shamali"
        enderecoLb.text = "Galeno de Castro 660, 614A, Jurubatuba"
        pedidoLb.text = "2 comb 66 \n1 comb 45 \n1 Carpaccio 60 fatias(Talvez) \n4 porções shimeji"
        obsLb.text = "4 pessoas"
    }
    
    
}
