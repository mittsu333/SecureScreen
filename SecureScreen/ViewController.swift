import UIKit
import AVFoundation

final class ViewController: UIViewController {

    private lazy var playerItem: AVPlayerItem = {
        guard let url = Bundle.main.url(forResource: "bike", withExtension: "mp4") else {
            fatalError("bike.mp4 not found.")
        }
        return AVPlayerItem(url: url)
    }()
    
    private lazy var queuePlayer: AVQueuePlayer = {
        return AVQueuePlayer(playerItem: playerItem)
    }()

    private var playerLooper: AVPlayerLooper? = nil

    @IBOutlet weak var secureImageView: UIView!
    @IBOutlet weak var secureMovieView: MovieView! {
        didSet {
            secureMovieView.addPlayer(queuePlayer: queuePlayer)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secureImageView.makeSecure()
        
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        queuePlayer.play()
        
        NotificationCenter.default.addObserver(
            forName: UIApplication.willEnterForegroundNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            if self?.queuePlayer.timeControlStatus == .paused {
                self?.queuePlayer.play()
            }
        }
    }
    
}

final class MovieView: UIView {
    private lazy var playerLayer = { AVPlayerLayer() }()
    
    func addPlayer(queuePlayer: AVQueuePlayer) {
        makeSecure()
        playerLayer.player = queuePlayer
        playerLayer.videoGravity = .resizeAspect
        layer.addSublayer(playerLayer)
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         playerLayer.frame = bounds
     }
}
