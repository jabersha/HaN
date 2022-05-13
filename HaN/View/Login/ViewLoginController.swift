//
//  ViewLoginController.swift
//  HaN
//
//  Created by Jaber Shamali on 01/05/22.
//


import UIKit

protocol ViewLoginControllerDelegate {
    func nextView()
    
}

class ViewLoginController: UIViewController, ViewLoginControllerDelegate{

    let viewLogin = ViewLogin()
    let viewEvents = ViewEventsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func nextView(){
        viewEvents.modalPresentationStyle = .fullScreen
        viewEvents.modalTransitionStyle = .coverVertical
        self.present(viewEvents, animated: true, completion: nil)
    }


}


class ViewLogin: UIView{
    
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate: ViewLoginControllerDelegate?

    
    lazy var logoImg: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "han")
        view.layer.cornerRadius = 20.0
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var userTxtFd: UITextField = {
        let view = UITextField(frame: .zero)
        view.keyboardType = .emailAddress
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        view.placeholder = "Login"
        view.textAlignment = .center
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    lazy var passTxtFd: UITextField = {
        let view = UITextField(frame: .zero)
        view.isSecureTextEntry = true
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        view.placeholder = "Senha"
        view.textAlignment = .center
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    lazy var userRecoveryBtn: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Esqueceu a senha?", for: .normal)
        view.setTitleColor( UIColor.darkGray , for: .normal)
        
        return view
    }()
    
    lazy var enterBtn: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        view.setTitle("Entrar", for: .normal)
        view.setTitleColor( UIColor.white , for: .normal)
        view.addTarget(self, action: #selector(buttonAct), for: .touchUpInside)

        return view
    }()
    
    
    @objc func buttonAct(sender: UIButton!){
        self.delegate?.nextView()
    }

}

extension ViewLoginController : CodeView{
    func buildHierarchy() {
        view.addSubview(viewLogin)
        view.addSubview(viewLogin.logoImg)
        view.addSubview(viewLogin.userTxtFd)
        view.addSubview(viewLogin.passTxtFd)
        view.addSubview(viewLogin.userRecoveryBtn)
        view.addSubview(viewLogin.enterBtn)

    }
    
    func configConstraints() {
        viewLogin.logoImg.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(70)
            make.centerX.equalToSuperview()
            
        }
        
        viewLogin.userTxtFd.snp.makeConstraints{ make in
            make.top.equalTo(viewLogin.logoImg.snp.bottom).offset(70)
            make.centerX.equalTo(viewLogin.logoImg)
            make.width.equalTo(190)
            make.height.equalTo(30)
        }
        
        viewLogin.passTxtFd.snp.makeConstraints{ make in
            make.top.equalTo(viewLogin.userTxtFd.snp.bottom).offset(30)
            make.centerX.equalTo(viewLogin.userTxtFd)
            make.left.right.equalTo(viewLogin.userTxtFd)
            make.height.equalTo(30)
        }
        
        viewLogin.userRecoveryBtn.snp.makeConstraints{ make in
            make.top.equalTo(viewLogin.passTxtFd.snp.bottom).offset(0)
            make.left.right.equalTo(viewLogin.passTxtFd)
            make.height.equalTo(30)
        }
        
        viewLogin.enterBtn.snp.makeConstraints{ make in
            make.top.equalTo(viewLogin.userRecoveryBtn.snp.bottom).offset(30)
            make.centerX.equalTo(viewLogin.userTxtFd)
            make.left.right.equalTo(viewLogin.passTxtFd)
            make.height.equalTo(50)
        }
    }
    
    func additionalConfig() {
        view.backgroundColor = .gray
        viewLogin.delegate = self

    }
    
    
}


