import UIKit
import SnapKit

class DetailViewController: UIViewController {
    private lazy var textField: UITextField = {
       let textField = UITextField()
        textField.textColor = .red
        return textField
    }()
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go back to VC1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    var completion: ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detail"
        setupViews()
        setupConstraints()
    }
    private func setupViews() {
        view.addSubview(textField)
        view.addSubview(button)
    }
    private func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(150)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
    }
    
    @objc func buttonPressed() {
        completion!(textField.text!)
        navigationController?.popViewController(animated: true)
    }
}
