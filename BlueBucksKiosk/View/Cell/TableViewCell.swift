
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cellCount: UILabel!
    @IBOutlet weak var countView: UIView!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var bottomBar: UIView!
    
    //예상 변수 이름 설정
    // var 더하기 빼기 : ((bool) -> ())?
    // var 종료 ((bool) -> ())?
    var increaseClosure: (() -> Void)?
    var decreaseClosure: (() -> Void)?
    var deleteClosure: (() -> Void)?
    
    static let identifier = "ShoppingCartCell"
    
    
    // 데이터 초기값 설정 후 UI에 매칭
    // To-do: 데이터 변경 후 코드 수정필요
    var product : Product? {
        didSet {
            if let product = product {
                let productDrink = product.drink
                let productSize = product.size
                let productCount = product.count
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                cellImage.image = productDrink.image
                name.text = productDrink.name.0
                switch productSize {
                case .tall:
                    size.text = "Tall"
                    let tallPrice = productDrink.price.0
                    let tallPriceResult = numberFormatter.string(for: tallPrice)
                    price.text = "\(tallPriceResult!)원"
                case .grande:
                    size.text = "Grande"
                    let grandePrice = productDrink.price.1
                    let grandePriceResult = numberFormatter.string(for: grandePrice)
                    price.text = "\(grandePriceResult!)원"
                case .venti:
                    size.text = "Venti"
                    let ventiPrice = productDrink.price.2
                    let ventiPriceResult = numberFormatter.string(for: ventiPrice)
                    price.text = "\(ventiPriceResult!)원"
                }
                size.textColor = .gray
                cellCount.text = String(productCount)
                cellImage.layer.cornerRadius = 8
                cellImage.layer.borderWidth = 2
                cellImage.clipsToBounds = true
                cellImage.layer.borderColor = UIColor.bluebucks.cgColor
                countView.layer.cornerRadius = 8
                minusBtn.backgroundColor = .clear
                plusBtn.backgroundColor = .clear
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // tag값에 따라 액션이 바뀌는 함수
    @IBAction func didTappedCountButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            decreaseClosure!()
        case 1:
            increaseClosure!()
        case 2:
            deleteClosure!()
        default:
            break
        }
    }
}
