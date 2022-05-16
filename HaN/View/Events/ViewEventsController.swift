//
//  ViewEventsController.swift
//  HaN
//
//  Created by Jaber Shamali on 01/05/22.
//

import UIKit

protocol ViewEventsControllerDelegate {
    func newEvent()
    func newEmployee()
}

class ViewEventsController: UIViewController, ViewEventsControllerDelegate {
    
    let viewEvents = ViewEvents()
    let viewEventsDetail = ViewEventsDetailController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    

    func newEvent() {
        
        viewEventsDetail.modalPresentationStyle = .overFullScreen
        viewEventsDetail.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(viewEventsDetail, animated: true)
        
    }
    
    func newEmployee() {
        
    }
    
}


class ViewEvents : UIView {
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate : ViewEventsControllerDelegate?

    
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
        view.addTarget(self, action: #selector(buttonShow), for: .touchUpInside)
        
        return view
    }()
    
    let tableEvents : UITableView = {
        let tableView = UITableView()
        tableView.indicatorStyle = .default
        tableView.backgroundColor = .systemGray5
        tableView.layer.cornerRadius = 20.0
        tableView.clipsToBounds = true
//            tableView.register(NotaNegocicaoCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    lazy var buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .fillEqually
        view.addArrangedSubview(eventBtn)
        view.addArrangedSubview(employeeBtn)
        view.backgroundColor =  UIColor.init(hexString: "#5f2539")
        view.layer.opacity = 0.8
        view.layer.cornerRadius = 15.0
        view.isHidden = true

        
        return view
    }()
    
    lazy var eventBtn: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Evento", for: .normal)
        view.tintColor = .white
        view.addTarget(self, action: #selector(buttonNewEvent), for: .touchUpInside)

        return view
    }()
    
    lazy var employeeBtn: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Funcionário", for: .normal)
        view.tintColor = .white
        view.addTarget(self, action: #selector(buttonNewEmployee), for: .touchUpInside)

        return view
    }()
    
    
    @objc func buttonShow(sender: UIButton!){
        
        buttonStackView.isHidden = !buttonStackView.isHidden
    }
    
    @objc func buttonNewEvent(sender: UIButton!){
        
        self.delegate?.newEvent()
        buttonStackView.isHidden = !buttonStackView.isHidden

    }
    
    @objc func buttonNewEmployee(sender: UIButton!){
        
        buttonStackView.isHidden = !buttonStackView.isHidden
    }
}


extension ViewEventsController: CodeView {
    func buildHierarchy() {
        view.addSubview(viewEvents)
        view.addSubview(viewEvents.logoImg)
        view.addSubview(viewEvents.tableEvents)
        view.addSubview(viewEvents.newEventBtn)
        view.addSubview(viewEvents.buttonStackView)

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
        
        viewEvents.buttonStackView.snp.makeConstraints{ make in
            make.bottom.equalTo(viewEvents.newEventBtn.snp.bottom).inset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(250)
        }
        
    }
    
    func additionalConfig() {
        viewEvents.buttonStackView.isHidden = true
        view.backgroundColor = UIColor.init(hexString: "#cbcbc9")
        viewEvents.delegate = self
    }
    
    
}
