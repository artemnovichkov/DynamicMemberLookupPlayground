import UIKit
import PlaygroundSupport

@dynamicMemberLookup
struct Selectors {

    subscript(dynamicMember member: String) -> Selector {
        return Selector(member)
    }
}

final class View: UIView {

    private let selectors: Selectors = .init()

    private(set) lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Tap", for: .normal)
        button.addTarget(self, action: selectors.tap, for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tap() {
        print("tap")
    }
}

PlaygroundPage.current.liveView = View(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
