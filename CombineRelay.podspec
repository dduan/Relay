Pod::Spec.new do |spec|
  spec.name                      = "CombineRelay"
  spec.module_name               = "Relay"
  spec.version                   = "0.1.2"
  spec.summary                   = "Relays for Combine."
  spec.homepage                  = "git@github.com:dduan/Relay.git"
  spec.license                   = { :type => "MIT", :file => "LICENSE.md" }
  spec.author                    = { "Daniel Duan" => "daniel@duan.ca" }
  spec.social_media_url          = "https://twitter.com/daniel_duan"
  spec.ios.deployment_target     = "13.0"
  spec.osx.deployment_target     = "10.15"
  spec.watchos.deployment_target = "6.0"
  spec.tvos.deployment_target    = "13.0"
  spec.source                    = { :git => "https://github.com/dduan/Relay.git", :tag => "#{spec.version}" }
  spec.source_files              = "Sources/Relay/*.swift"
end
