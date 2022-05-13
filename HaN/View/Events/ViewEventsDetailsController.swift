//
//  ViewEventsDetailsController.swift
//  HaN
//
//  Created by Jaber Shamali on 12/05/22.
//

import UIKit
import Foundation


class ViewEventsDetailsController: UIViewController {

    let viewEvents = ViewEvents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

}

class ViewDetailsEvents : UIView {
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var logoImg: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "han")
        return view
    }()
    
    
    lazy var newEventBtn: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .darkGray
        view.setTitle("+", for: .normal)
        view.titleLabel?.font = UIFont(name: "Arial", size: 90)
        
        return view
    }()
    
    let tableEvents : UITableView = {
        let tableView = UITableView()
        tableView.indicatorStyle = .default
        tableView.backgroundColor = .systemGray5
        tableView.layer.cornerRadius = 20.0
        tableView.clipsToBounds = true
        return tableView
    }()
}


extension ViewEventsDetailsController: CodeView {
    func buildHierarchy() {
        view.addSubview(viewEvents)
        view.addSubview(viewEvents.logoImg)
        view.addSubview(viewEvents.tableEvents)
        view.addSubview(viewEvents.newEventBtn)
    }
    
    func configConstraints() {
        
        viewEvents.logoImg.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(35)
            make.height.width.equalTo(60)
            make.centerX.equalToSuperview()
        }
        
        viewEvents.tableEvents.snp.makeConstraints{ make in
            make.top.equalTo(viewEvents.logoImg.snp.bottom).offset(10)
            make.bottom.equalTo(viewEvents.newEventBtn.snp.top).offset(15)
            make.left.right.equalToSuperview().offset(20).inset(20)
        }
        
        viewEvents.newEventBtn.snp.makeConstraints{ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(55)
        }

        
    }
    
    func additionalConfig() {
        view.backgroundColor = UIColor.init(hexString: "#cbcbc9")
    }
    
    
}
