Pod::Spec.new do |s|
  s.name          = "DNLoginServiceKit"
  s.version       = "1.0.0"
  s.summary       = "Easy manage login items in macOS"
  s.license       = { :type => 'apache2', :file => 'LICENSE' }
  s.homepage      = "https://github.com/dimitarnestorov/DNLoginServiceKit"
  s.author        = "Dimitar Nestorov"
  s.source        = { :git => "https://github.com/dimitarnestorov/DNLoginServiceKit.git", :tag => "v#{s.version}" }
  s.platform      = :osx, '10.10'
  s.source_files  = 'Lib/DNLoginServiceKit/*.{h,m}'
end
