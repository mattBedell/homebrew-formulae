class Mdrender < Formula
  desc "Render markdown in the terminal using Glamour"
  homepage "https://github.com/mattBedell/mdrender"
  url "https://github.com/mattBedell/mdrender/archive/v0.1.0.tar.gz"
  sha256 "91031e204b06c64aab2a448422f9f5e963ddcbd923dc7ebacdfa7a176472a410"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "dist/mdrender"
    bin.install "dist/mdrender" => "mdrender"
  end

  test do
    (testpath/"test.md").write <<~EOS
      # This is a markdown file

      > some quote goes here

      Here is some `information`
    EOS

    system "#{bin}/mdrender", "./test.md"
  end

  bottle do
    root_url "https://github.com/mattBedell/mdrender/releases/download/v0.1.0"
    cellar :any_skip_relocation
    sha256 "2ba4def69559f98723c2c25297d566e0aa0b67b1adda055fcfea338e60666ee0" => :catalina
  end
end
