cask "refill" do
  version "1.0.0"
  sha256 "d670c1c5f6294a1225884553416737345f9ba7440cfc40a85278e6b75db55f68"

  url "https://github.com/fenil210-cactus/refill/releases/download/v#{version}/Refill.zip"
  name "Refill"
  desc "Codex 5-hour and weekly limit resets as Apple Reminders"
  homepage "https://github.com/fenil210-cactus/refill"

  depends_on macos: :ventura

  app "Refill.app"
  binary "#{appdir}/Refill.app/Contents/MacOS/Refill", target: "refill"

  # Ad-hoc signed (no paid Apple Developer account): clear the download quarantine so it opens normally.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Refill.app"], must_succeed: false
  end

  uninstall quit: "com.fenil210.refill"

  zap trash: [
    "~/Library/Application Support/Refill",
    "~/Library/Preferences/com.fenil210.refill.plist",
  ]
end
