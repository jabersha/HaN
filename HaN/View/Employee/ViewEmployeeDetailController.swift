//
//  ViewEmployeeDetailController.swift
//  HaN
//
//  Created by Jaber Shamali on 22/05/22.
//

import Foundation
import UIKit

class ViewEmployeeDetailController: UIViewController{
    
    let viewEmployeeDetail = ViewEmployeeDetail()
    let campos = CamposView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configKeyboard()
        loadTextField()
        setupView()
        

    }
        

    func configureNavigation(){
        let backButton = UIBarButtonItem()
        backButton.title = "Funcionários"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let button = UIBarButtonItem(barButtonSystemItem: .save , target: self, action: nil)
        navigationItem.rightBarButtonItem = button

        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "han")
        imageView.image = image
        navigationItem.titleView = imageView

    }

}


class ViewEmployeeDetail : UIScrollView {
        
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 2
        view.backgroundColor = UIColor.init(hexString: "#cbcbc9")
        return view
        
    }()

}


extension ViewEmployeeDetailController: CodeView {
    func buildHierarchy() {
        view.addSubview(viewEmployeeDetail)
        viewEmployeeDetail.addSubview(viewEmployeeDetail.stackView)
        viewEmployeeDetail.stackView.addArrangedSubview(campos.campoClienteView)
        viewEmployeeDetail.stackView.addArrangedSubview(campos.campoContatoView)
        viewEmployeeDetail.stackView.addArrangedSubview(campos.campoObsView)



        
    }
    
    func configConstraints() {
        
        viewEmployeeDetail.snp.makeConstraints{ make in
            make.left.right.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
        }
        
        viewEmployeeDetail.stackView.snp.makeConstraints{ make in
            make.top.equalTo(viewEmployeeDetail)
            make.left.right.equalTo(viewEmployeeDetail)
            make.width.equalTo(viewEmployeeDetail.snp.width)

        }

        
        campos.campoClienteView.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(viewEmployeeDetail.stackView.snp.width)
 
        }
        
        campos.labelCliente.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.campoClienteView)
            make.left.equalTo(campos.campoClienteView).offset(10)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            
        }
        
        campos.txtClienteField.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.labelCliente)
            make.left.equalTo(campos.labelCliente.snp.right).offset(10)
            make.width.greaterThanOrEqualTo(250)
            make.rightMargin.equalTo(campos.campoClienteView.snp.rightMargin).inset(10)
            make.height.equalTo(33)
            
        }
        
        campos.campoContatoView.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(viewEmployeeDetail.stackView.snp.width)
 
        }
        
        campos.labelContato.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.campoContatoView)
            make.left.equalTo(campos.campoContatoView).offset(10)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            
        }
        
        campos.txtContatoField.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.labelContato)
            make.left.equalTo(campos.labelContato.snp.right).offset(10)
            make.width.greaterThanOrEqualTo(250)
            make.rightMargin.equalTo(campos.campoContatoView.snp.rightMargin).inset(10)
            make.height.equalTo(33)

        }
        
        campos.campoObsView.snp.makeConstraints{ make in
            make.height.equalTo(350)
            make.width.equalTo(viewEmployeeDetail.stackView.snp.width)
 
        }
        
        campos.labelObs.snp.makeConstraints{ make in
            make.top.equalTo(campos.campoObsView.snp.top).offset(10)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            make.left.equalTo(campos.campoObsView).offset(10)
            
        }
        
        campos.txtObsField.snp.makeConstraints{ make in
            make.top.equalTo(campos.labelObs.snp.bottom).offset(10)
            make.left.equalTo(campos.campoObsView).offset(10)
            make.right.equalTo(campos.campoObsView).inset(10)
            make.height.equalTo(280)

        }
       
    }
    
    func additionalConfig() {
        view.backgroundColor = UIColor.init(hexString: "#cbcbc9")
        campos.labelCliente.text = "Nome"
        campos.txtObsField.contentVerticalAlignment = .top
    }

}

extension ViewEmployeeDetailController: UITextFieldDelegate{
    
    func loadTextField(){
        self.campos.txtClienteField.delegate = self
        self.campos.txtContatoField.delegate = self
        self.campos.txtObsField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.campos.txtClienteField:
            self.campos.txtEnderecoField.becomeFirstResponder()
        case self.campos.txtContatoField:
            self.campos.txtObsField.becomeFirstResponder()
        default:
            self.campos.txtObsField.resignFirstResponder()
        }
    }
}


extension ViewEmployeeDetailController{

    func configKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
