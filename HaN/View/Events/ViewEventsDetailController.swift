//
//  ViewEventsDetailController.swift
//  HaN
//
//  Created by Jaber Shamali on 15/05/22.
//

import UIKit

protocol ViewEventsDetailControllerDelegate {

}

class ViewEventsDetailController: UIViewController, ViewEventsDetailControllerDelegate {
    
    let viewEventsDetail = ViewEventsDetail()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
    }

}


class ViewEventsDetail : UIView {
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    lazy var navBar: UINavigationBar = {
        let viewNavBar = UINavigationBar(frame: .zero)
        let navItem = UINavigationItem(title: "Evento")
        viewNavBar.setItems([navItem], animated: false)
        
        return viewNavBar
    }()

    
    lazy var logoImg: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "han")
        return view
    }()
    
}


extension ViewEventsDetailController: CodeView {
    func buildHierarchy() {
        view.addSubview(viewEventsDetail)
        view.addSubview(viewEventsDetail.logoImg)

    }
    
    func configConstraints() {
        
        viewEventsDetail.logoImg.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(35)
            make.height.width.equalTo(60)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func additionalConfig() {
        view.backgroundColor = UIColor.init(hexString: "#cbcbc9")
        let backButton = UIBarButtonItem()
        backButton.title = "Eventos"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    
}
