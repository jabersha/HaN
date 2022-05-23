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
        backButton.title = "Eventos"
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


class ViewEventsDetail : UIScrollView {
        
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


extension ViewEventsDetailController: CodeView {
    func buildHierarchy() {
        view.addSubview(viewEventsDetail)
        viewEventsDetail.addSubview(viewEventsDetail.stackView)
        viewEventsDetail.stackView.addArrangedSubview(campos.campoClienteView)
        viewEventsDetail.stackView.addArrangedSubview(campos.campoEnderecoView)
        viewEventsDetail.stackView.addArrangedSubview(campos.campoDataView)
        viewEventsDetail.stackView.addArrangedSubview(campos.campoContatoView)
        viewEventsDetail.stackView.addArrangedSubview(campos.campoDescricaoView)
        viewEventsDetail.stackView.addArrangedSubview(campos.campoObsView)
        viewEventsDetail.stackView.addArrangedSubview(campos.campoPagoView)


        
    }
    
    func configConstraints() {
        
        viewEventsDetail.snp.makeConstraints{ make in
            make.left.right.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
        }
        
        viewEventsDetail.stackView.snp.makeConstraints{ make in
            make.top.equalTo(viewEventsDetail)
            make.left.right.equalTo(viewEventsDetail)
            make.width.equalTo(viewEventsDetail.snp.width)

        }

        
        campos.campoClienteView.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(viewEventsDetail.stackView.snp.width)
 
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
        
        campos.campoEnderecoView.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(viewEventsDetail.stackView.snp.width)
 
        }
        
        campos.labelEndereco.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.campoEnderecoView)
            make.left.equalTo(campos.campoEnderecoView).offset(10)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            
        }
        
        campos.txtEnderecoField.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.labelEndereco)
            make.left.equalTo(campos.labelEndereco.snp.right).offset(10)
            make.width.greaterThanOrEqualTo(250)
            make.rightMargin.equalTo(campos.campoEnderecoView.snp.rightMargin).inset(10)
            make.height.equalTo(33)

        }
        
        campos.campoDataView.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(viewEventsDetail.stackView.snp.width)
 
        }
        
        campos.labelData.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.campoDataView)
            make.left.equalTo(campos.campoDataView).offset(10)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            
        }
        
        campos.campoDataDP.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.labelData)
            make.left.equalTo(campos.labelData.snp.right).offset(10)
            make.width.greaterThanOrEqualTo(250)
            make.rightMargin.equalTo(campos.campoDataView.snp.rightMargin).inset(10)
            
        }
        
        campos.campoContatoView.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(viewEventsDetail.stackView.snp.width)
 
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
        
        
        campos.campoDescricaoView.snp.makeConstraints{ make in
            make.height.equalTo(350)
            make.width.equalTo(viewEventsDetail.stackView.snp.width)
 
        }
        
        campos.labelDescricao.snp.makeConstraints{ make in
            make.top.equalTo(campos.campoDescricaoView.snp.top).offset(10)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            make.left.equalTo(campos.campoDescricaoView).offset(10)

        }
        
        campos.txtDescricaoField.snp.makeConstraints{ make in
            make.top.equalTo(campos.labelDescricao.snp.bottom).offset(10)
            make.left.equalTo(campos.campoDescricaoView).offset(10)
            make.right.equalTo(campos.campoDescricaoView).inset(10)
            make.height.equalTo(280)
            
        }
        
        campos.campoObsView.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(viewEventsDetail.stackView.snp.width)
 
        }
        
        campos.labelObs.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.campoObsView)
            make.left.equalTo(campos.campoObsView).offset(10)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            
        }
        
        campos.txtObsField.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.labelObs)
            make.left.equalTo(campos.labelObs.snp.right).offset(10)
            make.width.greaterThanOrEqualTo(300)
            make.rightMargin.equalTo(campos.campoObsView.snp.rightMargin).inset(10)
            make.height.equalTo(33)

        }
        
        campos.campoPagoView.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(viewEventsDetail.stackView.snp.width)
 
        }
        
        campos.labelPago.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.campoPagoView)
            make.left.equalTo(campos.campoPagoView).offset(10)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(30)
            
        }
        
        campos.pagoSwt.snp.makeConstraints{ make in
            make.centerY.equalTo(campos.labelPago)
            make.right.equalTo(campos.campoPagoView.snp.right).inset(10)
            
        }
        
        
        
    }
    
    func additionalConfig() {
        view.backgroundColor = UIColor.init(hexString: "#cbcbc9")
    }

}

extension ViewEventsDetailController: UITextFieldDelegate{
    
    func loadTextField(){
        self.campos.txtClienteField.delegate = self
        self.campos.txtEnderecoField.delegate = self
        self.campos.txtContatoField.delegate = self
        self.campos.txtDescricaoField.delegate = self
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
        case self.campos.txtEnderecoField:
            self.campos.txtContatoField.becomeFirstResponder()
        case self.campos.txtContatoField:
            self.campos.txtDescricaoField.becomeFirstResponder()
        case self.campos.txtDescricaoField:
            self.campos.txtObsField.becomeFirstResponder()
        default:
            self.campos.txtObsField.resignFirstResponder()
        }
    }
}


extension ViewEventsDetailController{

    func configKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardApear), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisapear), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    @objc func keyboardApear(){
        self.viewEventsDetail.contentSize.height = self.viewEventsDetail.frame.height + 250
    }
    
    @objc func keyboardDisapear(){
        self.viewEventsDetail.contentSize.height = self.viewEventsDetail.frame.height - 250
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
