//
//  CamposView.swift
//  HaN
//
//  Created by Jaber Shamali on 21/05/22.
//

import UIKit

class CamposView: UIView{
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var campoClienteView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor =  UIColor.init(hexString: "#5f2539")
        view.addSubview(labelCliente)
        view.addSubview(txtClienteField)
        
        
        return view
    }()
    
    lazy var labelCliente: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Cliente"
        label.textColor = .white
        return label
    }()
    
    lazy var txtClienteField: UITextField = {
        let view = UITextField(frame: .zero)
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        view.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        view.textAlignment = .left
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    
    lazy var campoDescricaoView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor =  UIColor.init(hexString: "#5f2539")
        view.addSubview(labelDescricao)
        view.addSubview(txtDescricaoField)
        
        
        return view
    }()
    
    lazy var labelDescricao: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Descrição"
        label.textColor = .white
        return label
    }()
    
    lazy var txtDescricaoField: UITextField = {
        let view = UITextField(frame: .zero)
        view.contentVerticalAlignment = .top
        view.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        view.textAlignment = .left
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    
    lazy var campoEnderecoView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor =  UIColor.init(hexString: "#5f2539")
        view.addSubview(labelEndereco)
        view.addSubview(txtEnderecoField)
        
        
        return view
    }()
    
    lazy var labelEndereco: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Endereço"
        label.textColor = .white
        return label
    }()
    
    lazy var txtEnderecoField: UITextField = {
        let view = UITextField(frame: .zero)
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        view.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        view.textAlignment = .left
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    lazy var campoDataView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor =  UIColor.init(hexString: "#5f2539")
        view.addSubview(labelData)
        view.addSubview(campoDataDP)
        
        
        return view
    }()
    
    lazy var labelData: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Data"
        label.textColor = .white
        return label
    }()
    
    lazy var campoDataDP: UIDatePicker = {
        let view = UIDatePicker(frame: .zero)
        
        return view
    }()
    
    lazy var campoContatoView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor =  UIColor.init(hexString: "#5f2539")
        view.addSubview(labelContato)
        view.addSubview(txtContatoField)
        
        
        return view
    }()
    
    lazy var labelContato: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Contato"
        label.textColor = .white
        return label
    }()
    
    lazy var txtContatoField: UITextField = {
        let view = UITextField(frame: .zero)
        view.layer.cornerRadius = 5.0
        view.keyboardType = .numberPad
        view.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        view.clipsToBounds = true
        view.textAlignment = .left
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    
    lazy var campoObsView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor =  UIColor.init(hexString: "#5f2539")
        view.addSubview(labelObs)
        view.addSubview(txtObsField)
        
        
        return view
    }()
    
    lazy var labelObs: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Obs"
        label.textColor = .white
        return label
    }()
    
    lazy var txtObsField: UITextField = {
        let view = UITextField(frame: .zero)
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        view.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        view.textAlignment = .left
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    lazy var campoPagoView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor =  UIColor.init(hexString: "#5f2539")
        view.addSubview(labelPago)
        view.addSubview(pagoSwt)
        
        
        return view
    }()
    
    lazy var labelPago: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Pago"
        label.textColor = .white
        return label
    }()
    
    lazy var pagoSwt: UISwitch = {
        let view = UISwitch(frame: .zero)
        
        return view
    }()

}

