//
//  MainPageView.swift
//  ClassWork25_BegiK
//
//  Created by M1 on 10.05.2024.
//

import UIKit

class MainPageView: UIViewController {
    
    //MARK: Properties:
    var viewModel: MainPageViewModel
    
    private var navBar: UIView = {
        let navBar = UIView()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.heightAnchor.constraint(equalToConstant: 85).isActive = true
        navBar.layer.cornerRadius = 40
        navBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        navBar.backgroundColor = UIColor(red: 10/255, green: 9/255, blue: 30/255, alpha: 1)
        navBar.layer.shadowColor = UIColor.white.cgColor
        navBar.layer.shadowOpacity = 0.2
        navBar.layer.shadowOffset = .zero
        navBar.layer.shadowRadius = 40
        return navBar
    }()
    
    private var homeIcon = UIButton().createButton(name: "house")
    
    private var musicIcon = UIButton().createButton(name: "music.note")
    
    private var heartIcon = UIButton().createButton(name: "heart")
    
    private var homeIconsWidth: NSLayoutConstraint?
    
    private var homeIconsHeight: NSLayoutConstraint?
    
    private var musicIconsWidth: NSLayoutConstraint?
    
    private var musicIconsHeight: NSLayoutConstraint?
    
    private var heartIconsWidth: NSLayoutConstraint?
    
    private var heartIconsHeight: NSLayoutConstraint?
    
    private var buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private var shuffle = UIButton().createButton(name: "shuffle")
    
    private var skipBack = UIButton().createButton(name: "backward.end")
    
    private var playButton: UIButton = {
        let play = UIButton()
        play.translatesAutoresizingMaskIntoConstraints = false
        play.backgroundColor = .systemBlue
        play.layer.cornerRadius = 37
        play.setImage(UIImage(named: "play2"), for: .normal)
        play.imageView?.contentMode = .scaleToFill
        return play
    }()
    
    private var forward = UIButton().createButton(name: "forward.end")
    
    private var repeatMusic = UIButton().createButton(name: "repeat")
    
    private let progressLineView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .white
        progressView.backgroundColor = .black
        return progressView
    }()
    
    private var timer: Timer?
    
    private var elapsedTimeWhenPaused: CFTimeInterval = 0

    private var startTime: CFTimeInterval = 0
    
    private let totalDuration: CFTimeInterval = 60.0
    
    private var displayLink: CADisplayLink?
    
    private var songTitle: UILabel = {
        let title = UILabel()
        title.text = "Lose Yourself"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.font = UIFont(name: "SF Pro", size: 24)
        return title
    }()
    
    private var songArtist: UILabel = {
        let title = UILabel()
        title.text = "Eminem"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.font = UIFont(name: "SF Pro", size: 18)
        return title
    }()
    
    private var coverPhoto: UIImageView = {
        let coverPhoto = UIImageView()
        coverPhoto.translatesAutoresizingMaskIntoConstraints = false
        coverPhoto.image = UIImage(named: "coverPhoto")
        coverPhoto.heightAnchor.constraint(equalToConstant: 319).isActive = true
        return coverPhoto
    }()
    
    private var loader: UIImageView = {
       let loader = UIImageView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.image = UIImage(named: "loader")
        loader.heightAnchor.constraint(equalToConstant: 56).isActive = true
        loader.widthAnchor.constraint(equalToConstant: 56).isActive = true
        return loader
    }()
    
    private var heartsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    //MARK: Lifecycle:
    init(viewModel: MainPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.didLoad()
        navButtonActions()
        playButton.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
    }
    
    //MARK: Functions
    func setupUI() {
        view.backgroundColor = .black
        setupNav()
        setupButtons()
        setupProgressView()
        setupSongDetails()
        setupHearts()
    }
    
    func setupNav() {
        view.addSubview(navBar)
        NSLayoutConstraint.activate([
            navBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        navBar.addSubview(homeIcon)
        navBar.addSubview(musicIcon)
        navBar.addSubview(heartIcon)
        NSLayoutConstraint.activate([
            homeIcon.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 37.5),
            homeIcon.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            musicIcon.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            musicIcon.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            heartIcon.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -37.5),
            heartIcon.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
        ])
        homeIconsWidth = homeIcon.widthAnchor.constraint(equalToConstant: 21)
        homeIconsWidth?.isActive = true
        homeIconsHeight = homeIcon.heightAnchor.constraint(equalToConstant: 21)
        homeIconsHeight?.isActive = true
        musicIconsWidth = musicIcon.widthAnchor.constraint(equalToConstant: 21)
        musicIconsWidth?.isActive = true
        musicIconsHeight = musicIcon.heightAnchor.constraint(equalToConstant: 21)
        musicIconsHeight?.isActive = true
        heartIconsWidth = heartIcon.widthAnchor.constraint(equalToConstant: 21)
        heartIconsWidth?.isActive = true
        heartIconsHeight = heartIcon.heightAnchor.constraint(equalToConstant: 21)
        heartIconsHeight?.isActive = true
    }
    
    func setupButtons() {
        view.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(shuffle)
        buttonsStack.addArrangedSubview(skipBack)
        buttonsStack.addArrangedSubview(playButton)
        buttonsStack.addArrangedSubview(forward)
        buttonsStack.addArrangedSubview(repeatMusic)
        NSLayoutConstraint.activate([
            buttonsStack.bottomAnchor.constraint(equalTo: navBar.topAnchor, constant: -40),
            buttonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonsStack.heightAnchor.constraint(equalToConstant: 74),
            shuffle.widthAnchor.constraint(equalToConstant: 25),
            shuffle.heightAnchor.constraint(equalToConstant: 24),
            skipBack.widthAnchor.constraint(equalToConstant: 25),
            skipBack.heightAnchor.constraint(equalToConstant: 24),
            forward.widthAnchor.constraint(equalToConstant: 25),
            forward.heightAnchor.constraint(equalToConstant: 24),
            repeatMusic.widthAnchor.constraint(equalToConstant: 25),
            repeatMusic.heightAnchor.constraint(equalToConstant: 24),
            playButton.widthAnchor.constraint(equalToConstant: 75),
            playButton.heightAnchor.constraint(equalToConstant: 74),
        ])
    }
    
    func setupProgressView() {
        view.addSubview(progressLineView)
        NSLayoutConstraint.activate([
            progressLineView.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -34),
            progressLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            progressLineView.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
    
    func setupSongDetails() {
        view.addSubview(songArtist)
        view.addSubview(songTitle)
        view.addSubview(coverPhoto)
        NSLayoutConstraint.activate([
            songArtist.bottomAnchor.constraint(equalTo: progressLineView.topAnchor, constant: -34),
            songArtist.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            songTitle.bottomAnchor.constraint(equalTo: songArtist.topAnchor, constant: -7),
            songTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coverPhoto.bottomAnchor.constraint(equalTo: songTitle.topAnchor, constant: -34),
            coverPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            coverPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupHearts() {
        view.addSubview(heartsStack)
        NSLayoutConstraint.activate([
            heartsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heartsStack.bottomAnchor.constraint(equalTo: coverPhoto.topAnchor, constant: -24),
            heartsStack.widthAnchor.constraint(equalToConstant: 160),
            heartsStack.heightAnchor.constraint(equalToConstant: 24)
        ])
        for _ in 0..<5 {
            let heartButton = UIButton()
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = .white
            heartsStack.isUserInteractionEnabled = true
            heartsStack.addArrangedSubview(heartButton)
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(heartsSwiped(_:)))
            swipeGesture.direction = .right
            heartsStack.addGestureRecognizer(swipeGesture)
        }
    }
    
    @objc func heartsSwiped(_ sender: UISwipeGestureRecognizer) {
        heartsStack.subviews.forEach { subview in
            if let heartButton = subview as? UIButton {
                heartButton.tintColor = .red
            }
        }
    }
    
    func navButtonActions() {
        homeIcon.addAction(UIAction(handler: { _ in
            self.animateButtonSize(self.homeIcon)
        }), for: .touchUpInside)
        musicIcon.addAction(UIAction(handler: { _ in
            self.animateButtonSize(self.musicIcon)
        }), for: .touchUpInside)
        heartIcon.addAction(UIAction(handler: { _ in
            self.animateButtonSize(self.heartIcon)
        }), for: .touchUpInside)
    }
    
    private func animateButtonSize(_ button: UIButton?) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.navBar.layoutIfNeeded()
            
            if button == self?.homeIcon {
                self?.homeIconsWidth?.constant = 35
                self?.homeIconsHeight?.constant = 35
                self?.homeIcon.tintColor = .systemBlue
                self?.musicIconsWidth?.constant = 21
                self?.musicIconsHeight?.constant = 21
                self?.musicIcon.tintColor = .white
                self?.heartIconsWidth?.constant = 21
                self?.heartIconsHeight?.constant = 21
                self?.heartIcon.tintColor = .white
            } else if button == self?.musicIcon {
                self?.homeIconsWidth?.constant = 21
                self?.homeIconsHeight?.constant = 21
                self?.homeIcon.tintColor = .white
                self?.musicIconsWidth?.constant = 35
                self?.musicIconsHeight?.constant = 35
                self?.musicIcon.tintColor = .systemBlue
                self?.heartIconsWidth?.constant = 21
                self?.heartIconsHeight?.constant = 21
                self?.heartIcon.tintColor = .white
            } else if button == self?.heartIcon {
                self?.homeIconsWidth?.constant = 21
                self?.homeIconsHeight?.constant = 21
                self?.homeIcon.tintColor = .white
                self?.musicIconsWidth?.constant = 21
                self?.musicIconsHeight?.constant = 21
                self?.musicIcon.tintColor = .white
                self?.heartIconsWidth?.constant = 35
                self?.heartIconsHeight?.constant = 35
                self?.heartIcon.tintColor = .systemBlue
            }
        }
    }
    
    @objc private func playPauseButtonTapped(_ sender: UIButton) {
        if playButton.currentImage == UIImage(named: "play2") {
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            startAnimation()
            timer?.invalidate()
            timer = nil
            view.addSubview(loader)
            NSLayoutConstraint.activate([
                loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loader.bottomAnchor.constraint(equalTo: coverPhoto.bottomAnchor, constant: 20)
            ])
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.loader.removeFromSuperview()
                self.coverPhoto.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        } else {
            playButton.setImage(UIImage(named: "play2"), for: .normal)
            stopAnimation()
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(returnImageSize), userInfo: nil, repeats: false)
        }
    }
    
    @objc private func returnImageSize() {
        UIView.animate(withDuration: 0.3) {
            self.coverPhoto.transform = .identity
        }
    }
    
    private func startAnimation() {
        if elapsedTimeWhenPaused == 0 {
            startTime = CACurrentMediaTime()
        } else {
            startTime = CACurrentMediaTime() - elapsedTimeWhenPaused
        }
        progressLineView.progress = Float(elapsedTimeWhenPaused / totalDuration)
        displayLink = CADisplayLink(target: self, selector: #selector(updateProgressLine))
        displayLink?.add(to: .current, forMode: .default)
        UIView.animate(withDuration: 0.3) {
            self.coverPhoto.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
    }

    private func stopAnimation() {
        displayLink?.invalidate()
        displayLink = nil
        progressLineView.layer.removeAllAnimations()
        elapsedTimeWhenPaused = CACurrentMediaTime() - startTime
        UIView.animate(withDuration: 0.3) {
            self.coverPhoto.transform = .identity
        }
    }
    
    @objc private func updateProgressLine() {
        let elapsedTime = CACurrentMediaTime() - startTime
        let progress = Float(elapsedTime / totalDuration)
        progressLineView.setProgress(progress, animated: true)
        if progress >= 1.0 {
            stopAnimation()
        }
    }
    
    
}
