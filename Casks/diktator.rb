cask "diktator" do
  version "1.1.0"
  sha256 "cfb011d00bf9bc36bc490e0f77e8b703c1b5b5f06cb022d6bbb7c79a58c2ee2a"

  url "https://github.com/sawasawasawa/diktator-releases/releases/download/v#{version}/Diktator.zip"
  name "Diktator"
  desc "Local voice-to-text for Mac. Push-to-talk, transcribe on-device, paste anywhere."
  homepage "https://diktator.app"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Diktator.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Diktator.app"]
  end

  zap trash: [
    "~/Library/Application Support/Diktator",
    "~/Library/Logs/Diktator",
  ]

  caveats <<~EOS
    Diktator needs Accessibility and Microphone permissions.
    Grant them in System Settings > Privacy & Security after first launch.

    Optional: Install Ollama (https://ollama.com) for AI text cleanup.
  EOS
end
