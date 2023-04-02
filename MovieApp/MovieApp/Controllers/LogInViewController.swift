import UIKit
import PureLayout

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

class LogInViewController: UIViewController {
    private var headTitle: UILabel!
    private var emailTitle: UILabel!
    private var passwordTitle: UILabel!
    private var emailText: UITextField!
    private var passwordText: UITextField!
    private var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
        
        
    private func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    private func createViews() {
        headTitle = UILabel()
        view.addSubview(headTitle)
        headTitle?.text = "Sign in"
        
        emailTitle = UILabel()
        view.addSubview(emailTitle)
        emailTitle?.text = "Email address"
        
        passwordTitle = UILabel()
        view.addSubview(passwordTitle)
        passwordTitle?.text = "Password"
        
        emailText = UITextField()
        view.addSubview(emailText)
        emailText.attributedText = NSAttributedString(string: "ex. Matt@iosCoursce.com")
        
        passwordText = UITextField()
        view.addSubview(emailText)
        passwordText.attributedText = NSAttributedString(string: "Enter your password")
        view.addSubview(passwordText)
        
        signInButton = UIButton()
        signInButton.setTitle("Sign in", for: .normal)
        view.addSubview(signInButton)
        
    }
    
    private func styleViews() {
        view.backgroundColor = UIColor(red: 11/255, green: 37/255, blue: 63/255, alpha: 1)
        
        headTitle.textColor = .white
        headTitle.textAlignment = NSTextAlignment.center
        headTitle.font = UIFont.systemFont(ofSize: 24)
        
        
        emailTitle.textColor = .white
        emailTitle.font = UIFont.systemFont(ofSize: 16)
        passwordTitle.textColor = .white
        passwordTitle.font = UIFont.systemFont(ofSize: 16)
        
        let textFieldBackgroundColor = UIColor(red: 19/255, green: 59/255, blue: 99/255, alpha: 1)
        let textFieldFontColor = UIColor(red: 76/255, green: 178/255, blue: 223/255, alpha: 1)
        let textFieldBorderColor = CGColor(red: 21/255, green: 77/255, blue: 133/255, alpha: 1)
        
        emailText.backgroundColor = textFieldBackgroundColor
        emailText.textColor = textFieldFontColor
        emailText.layer.cornerRadius = 5
        emailText.layer.borderColor = textFieldBorderColor
        emailText.layer.borderWidth = 1.0
        emailText.setLeftPaddingPoints(16)
        
        passwordText.backgroundColor = textFieldBackgroundColor
        passwordText.textColor = textFieldFontColor
        passwordText.layer.cornerRadius = 5
        passwordText.layer.borderColor = textFieldBorderColor
        passwordText.layer.borderWidth = 1.0
        passwordText.setLeftPaddingPoints(16)
        
        signInButton.setTitleColor(.white, for: UIControl.State.normal)
        signInButton.backgroundColor = UIColor(red: 76/255, green: 178/255, blue: 223/255, alpha: 1)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signInButton.layer.cornerRadius = 5
    }
    
    private func defineLayoutForViews() {
        headTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        headTitle.autoPinEdge(toSuperviewEdge: .top, withInset: 92)
        headTitle.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        
        emailTitle.autoPinEdge(.top, to: .bottom, of: headTitle, withOffset: 48)
        emailTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        
        emailText.autoPinEdge(.top, to: .bottom, of: emailTitle, withOffset: 8)
        emailText.autoSetDimension(.height, toSize: 48)
        emailText.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        emailText.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)

        passwordTitle.autoPinEdge(.top, to: .bottom, of: emailText, withOffset: 24)
        passwordTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)

        passwordText.autoPinEdge(.top, to: .bottom, of: passwordTitle, withOffset: 8)
        passwordText.autoSetDimension(.height, toSize: 48)
        passwordText.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        passwordText.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        
        signInButton.autoPinEdge(.top, to: .bottom, of: passwordText, withOffset: 48)
        signInButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 32)
        signInButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 32)
        signInButton.autoSetDimension(.height, toSize: 40)
        
    }
    
}
