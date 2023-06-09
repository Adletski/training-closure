import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var label: UILabel = {
       let label = UILabel()
        label.text = "Full Name"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Navigate to VC 2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Closure"
        setupViews()
        setupConstraints()
    }
    private func setupViews() {
        view.addSubview(label)
        view.addSubview(button)
    }
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
    }
    @objc func buttonPressed() {
        let detailVC = DetailViewController()
        detailVC.completion = { [weak self] data in
            print("adlet")
            self?.label.text = data
        }
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

