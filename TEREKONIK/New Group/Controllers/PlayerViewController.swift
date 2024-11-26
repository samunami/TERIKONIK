//
//  PlayerViewController.swift
//  TEREKONIK
//
//  Created by Alexander on 26.11.2024.
//

import UIKit

class PlayerViewController: UIViewController {
    private let style: String
    private let playPauseButton = UIButton(type: .system)
    private let trackLabel = UILabel()
    private var isPlaying = false
    
    init(style: String) {
        self.style = style
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Плеер"
        
        // Текст текущего трека
        trackLabel.text = "Текущий стиль: \(style)"
        trackLabel.textAlignment = .center
        trackLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackLabel)
        
        // Кнопка воспроизведения/паузы
        playPauseButton.setTitle("▶️", for: .normal)
        playPauseButton.addTarget(self, action: #selector(togglePlayback), for: .touchUpInside)
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playPauseButton)
        
        // Устанавливаем Constraints
        NSLayoutConstraint.activate([
            trackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trackLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            
            playPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playPauseButton.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func togglePlayback() {
        isPlaying.toggle()
        playPauseButton.setTitle(isPlaying ? "⏸️" : "▶️", for: .normal)
    }
}
