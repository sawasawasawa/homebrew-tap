cask "diktator" do
  version "1.1.0"
  sha256 "7f40c3d0b435d67762edf9d1ec364e78d8d4ad8f01899f2850b301d685cd9662"

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
