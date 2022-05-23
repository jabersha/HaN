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
    func logout()
}

class ViewEventsController: UIViewController, ViewEventsControllerDelegate {
    
    let viewEvents = ViewEvents()
    let viewEventsDetail = ViewEventsDetailController()
    let viewEmployeeDetail = ViewEmployeeDetailController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
        setupView()


    }
    

    func newEvent() {
        viewEventsDetail.modalPresentationStyle = .overFullScreen
        viewEventsDetail.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(viewEventsDetail, animated: true)
        
    }
    
    func newEmployee() {
        viewEventsDetail.modalPresentationStyle = .overFullScreen
        viewEventsDetail.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(viewEmployeeDetail, animated: true)
    }
    
    @objc func logout(){
        dismiss(animated: true)
    }
    
    func configureNav(){
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: UIImage(named: "logout")?.withRenderingMode(.alwaysOriginal),
//            style: .plain, target: self, action: #selector(logout))
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "han")
        imageView.image = image
        navigationItem.titleView = imageView
        
        let logoutBtn = UIButton(type: .custom)
        logoutBtn.setImage(UIImage(named:"logout"), for: .normal)
        logoutBtn.addTarget(self, action: #selector(logout), for: .touchUpInside)
        let menuBarItem = UIBarButtonItem(customView: logoutBtn)
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 22).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 22).isActive = true

        navigationItem.rightBarButtonItem = menuBarItem

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
    
    lazy var logoutBtn: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.setImage(UIImage(named: "logout"), for: .normal)
        btn.addTarget(self, action: #selector(buttonLogout), for: .touchUpInside)
        return btn
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
        tableView.register(EventsCell.self, forCellReuseIdentifier: EventsCell.identifier)
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
        
        self.delegate?.newEmployee()
        buttonStackView.isHidden = !buttonStackView.isHidden
    }
    
    @objc func buttonLogout(sender: UIButton!){
        
        self.delegate?.logout()
    }
    
}


extension ViewEventsController: CodeView {
    func buildHierarchy() {
        view.addSubview(viewEvents)
        view.addSubview(viewEvents.tableEvents)
        view.addSubview(viewEvents.newEventBtn)
        view.addSubview(viewEvents.buttonStackView)

    }
    
    func configConstraints() {
        
        viewEvents.tableEvents.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
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
        view.backgroundColor = UIColor.init(hexString: "#cbcbc9")
        viewEvents.buttonStackView.isHidden = true
        viewEvents.delegate = self
        viewEvents.tableEvents.delegate = self
        viewEvents.tableEvents.dataSource = self

    }
    
}

extension ViewEventsController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventsCell.identifier, for: indexPath) as? EventsCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
