# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{busybody}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Harris Novick"]
  s.cert_chain = ["/Users/Harris/git/keyring/gem-public_cert.pem"]
  s.date = %q{2011-03-01}
  s.description = %q{A gem that fetches the primary twitter and facebook urls from any website.}
  s.email = %q{harris @nospam@ harrisnovick.com}
  s.extra_rdoc_files = ["lib/busybody.rb"]
  s.files = ["Rakefile", "lib/busybody.rb", "Manifest", "busybody.gemspec"]
  s.homepage = %q{http://github.com/lightyrs/busybody}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Busybody", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{busybody}
  s.rubygems_version = %q{1.3.7}
  s.signing_key = %q{/Users/Harris/git/keyring/gem-private_key.pem}
  s.summary = %q{A gem that fetches the primary twitter and facebook urls from any website.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
