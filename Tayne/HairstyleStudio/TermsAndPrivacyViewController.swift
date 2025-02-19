//
//  TermsAndPrivacyViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/12.
//

import UIKit

class TermsAndPrivacyViewController: TayneBaseViewController {
    
    var tayneType = 0 // 0 用户协议  1 隐私协议
    
    var tyeTextView:UITextView?

    var tayneCrowdStyle:[String:Any] = [:]
    
    var tayneStyleSnapState:[Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tayneCrowdStyle.keys.contains(TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")) == false {
            tayneCrowdStyle[TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")] = TayneConfig.tyeTransformInput("Tcrrecngdj tPtutlpspe")
        }
        
        if tayneCrowdStyle.count > 0 {
            tayneStyleSnapState.append(0)
        }
        
        
        if tayneCrowdStyle.count > 0 && tayneCrowdStyle.isEmpty == false {
            tayneStyleSnapState.append(contentsOf: Array(tayneCrowdStyle.keys))
        }
        
        tayneStyleSnapState.append([1,TayneConfig.tayneFilter.configTypeDes])
        
        tayneCrowdStyle[TayneConfig.tyeTransformInput("crorndfniqgoTtynpzelDoezs")] = TayneConfig.tayneFilter.configTypeDes
        
        if tayneStyleSnapState.contains(where: {($0 as? Int) == 0}) {
            tayneCrowdStyle["tayneStyleSnapState"] = 200
            
            tyeConfigSubViews()
        }
        
    }
    
    func tyeConfigSubViews(){
        
        if tyeTextView == nil && tayneType < 2 {
            
            let backImageView = UIImageView(image: UIImage(named: "tayneLoginBackImage"))
            view.addSubview(backImageView)
            backImageView.snp.makeConstraints { make in
                make.left.right.bottom.equalToSuperview()
                make.top.equalToSuperview()
            }
            
            tyeTextView = UITextView()
            tyeTextView?.isEditable = false
            tyeTextView?.textColor = .white
            tyeTextView?.font = .systemFont(ofSize: 15, weight: .medium)
            tyeTextView?.backgroundColor = .clear
            view.addSubview(tyeTextView!)
            tyeTextView?.snp.makeConstraints({ make in
                make.edges.equalToSuperview()
            })
            
            var tyeTerms = ""
            if tayneType == 0 {
                tyeTerms =
                """
                Terms of Service

                1. Acceptance of Terms
                Welcome to the Tayne application (hereinafter referred to as “the app”). By accessing and using this app, you agree to comply with and accept the following terms and conditions (hereinafter referred to as “Terms of Service”). If you do not agree with these terms, please do not use this app.

                2. Service Description
                Tayne is a social platform for fashion pioneers and hair lovers, providing features such as hairstyle challenges, real-time communication, AI hairstyle generation, and more. We are dedicated to offering users a platform for creative sharing and inspiration.

                3. User Account
                To use certain features of the app, you may need to create an account. You agree to provide accurate and complete registration information. You are responsible for the security of your account and password, and agree to be responsible for all activities that occur through your account.

                4. User Behavior
                You agree to:
                    •    Comply with all applicable laws and regulations while using this app.
                    •    Not post or share any illegal, infringing, malicious, obscene, or offensive content.
                    •    Respect the rights of other users and not infringe on their privacy, intellectual property, etc.

                5. Ownership of Content
                Any content you upload to the app (such as photos, challenge entries, hairstyle descriptions, etc.) remains your property. However, you grant us a global license to use, reproduce, display, modify, etc. We will not sell or rent your content without your explicit consent.

                6. Prohibited Actions
                You shall not:
                    •    Post, distribute, or transmit any malicious software, viruses, spyware, etc. via the app.
                    •    Modify or interfere with the normal operation of the app.
                    •    Access other users’ accounts or data without authorization.

                7. Service Interruption and Termination
                We reserve the right to modify, suspend, or terminate the service at any time. If you violate these Terms of Service, we have the right to suspend or terminate your account immediately.

                8. Disclaimer
                The app is provided “as is” without any guarantees. We do not guarantee the continuous availability, accuracy, or fault-free operation of the service.

                9. Limitation of Liability
                We are not liable for any indirect, incidental, special, or consequential damages arising from your use of the app.

                10. Modifications to the Terms
                We may modify these Terms of Service at any time. Any changes will take effect once the updated Terms are published. Continued use of the app constitutes your acceptance of the revised terms.

                11. Governing Law and Dispute Resolution
                These terms are governed by the laws of your country or region. In case of disputes, both parties should try to resolve the matter amicably; if that fails, the matter will be submitted to a court with jurisdiction.
                """
            }else{
                tyeTerms =
                """
                Privacy Policy

                1. Information Collection
                We collect personal information you provide when using the app, including but not limited to:
                    •    Registration Information: such as your name, email address, username, etc.
                    •    Usage Information: such as your interactions within the app, challenge entries, hairstyle descriptions, chat records, etc.
                    •    Device Information: such as device model, operating system, IP address, etc.

                2. Information Usage
                We use the collected information for the following purposes:
                    •    To provide personalized services and content recommendations.
                    •    To improve the app’s functionality and user experience.
                    •    To conduct market analysis and research to improve our services.
                    •    To send you app updates, news, and notifications (you can opt out at any time).

                3. Information Sharing
                We promise not to sell or rent your personal information to third parties, but we may share your information in the following circumstances:
                    •    When sharing information with partners providing services (such as payment processing, data analytics, etc.).
                    •    When required by law or legal order.
                    •    When you consent to sharing your information with third parties.

                4. Data Storage and Security
                We take reasonable technical and administrative measures to protect your personal information from unauthorized access, disclosure, or alteration. However, please be aware that, despite our efforts, no data transmission can be completely secure.

                5. Third-Party Services
                The app may contain links or services integrated with third parties (such as social media sharing, advertising services). These third-party privacy policies are not governed by this Privacy Policy. Please review their privacy policies when using these services.

                6. Children’s Privacy
                This app is not intended for children under 13 and we do not intentionally collect personal information from such children. If we become aware that we have inadvertently collected personal information from children under 13, we will delete that information promptly.

                7. Changes to the Privacy Policy
                We reserve the right to modify this Privacy Policy at any time. Any changes will take effect once the updated Privacy Policy is published. Continued use of the app constitutes your acceptance of the revised policy.

                8. Contact Us
                If you have any questions or concerns about this Privacy Policy, or wish to access, update, or delete your personal information, please contact us at:
                    •    Email: contact@tayneapp.com
                """
            }
            tyeTextView?.insertText(tyeTerms)
        }
    }
}
