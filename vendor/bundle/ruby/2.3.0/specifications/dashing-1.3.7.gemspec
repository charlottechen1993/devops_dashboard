# -*- encoding: utf-8 -*-
# stub: dashing 1.3.7 ruby lib

Gem::Specification.new do |s|
  s.name = "dashing"
  s.version = "1.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Daniel Beauchamp"]
  s.date = "2016-04-11"
  s.description = "This framework lets you build & easily layout dashboards with your own custom widgets. Use it to make a status boards for your ops team, or use it to track signups, conversion rates, or whatever else metrics you'd like to see in one spot. Included with the framework are ready-made widgets for you to use or customize. All of this code was extracted out of a project at Shopify that displays dashboards on TVs around the office."
  s.email = "daniel.beauchamp@shopify.com"
  s.executables = ["dashing"]
  s.files = ["bin/dashing"]
  s.homepage = "http://shopify.github.com/dashing"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "The exceptionally handsome dashboard framework."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sass>, ["~> 3.2.12"])
      s.add_runtime_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_runtime_dependency(%q<execjs>, ["~> 2.0.2"])
      s.add_runtime_dependency(%q<sinatra>, ["~> 1.4.4"])
      s.add_runtime_dependency(%q<sinatra-contrib>, ["~> 1.4.2"])
      s.add_runtime_dependency(%q<thin>, ["~> 1.6.1"])
      s.add_runtime_dependency(%q<rufus-scheduler>, ["~> 2.0.24"])
      s.add_runtime_dependency(%q<thor>, ["> 0.18.1"])
      s.add_runtime_dependency(%q<sprockets>, ["~> 2.10.1"])
      s.add_runtime_dependency(%q<rack>, ["~> 1.5.4"])
      s.add_development_dependency(%q<rake>, ["~> 10.1.0"])
      s.add_development_dependency(%q<haml>, ["~> 4.0.4"])
      s.add_development_dependency(%q<minitest>, ["~> 5.2.0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.14.0"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.8.2"])
    else
      s.add_dependency(%q<sass>, ["~> 3.2.12"])
      s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_dependency(%q<execjs>, ["~> 2.0.2"])
      s.add_dependency(%q<sinatra>, ["~> 1.4.4"])
      s.add_dependency(%q<sinatra-contrib>, ["~> 1.4.2"])
      s.add_dependency(%q<thin>, ["~> 1.6.1"])
      s.add_dependency(%q<rufus-scheduler>, ["~> 2.0.24"])
      s.add_dependency(%q<thor>, ["> 0.18.1"])
      s.add_dependency(%q<sprockets>, ["~> 2.10.1"])
      s.add_dependency(%q<rack>, ["~> 1.5.4"])
      s.add_dependency(%q<rake>, ["~> 10.1.0"])
      s.add_dependency(%q<haml>, ["~> 4.0.4"])
      s.add_dependency(%q<minitest>, ["~> 5.2.0"])
      s.add_dependency(%q<mocha>, ["~> 0.14.0"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.8.2"])
    end
  else
    s.add_dependency(%q<sass>, ["~> 3.2.12"])
    s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
    s.add_dependency(%q<execjs>, ["~> 2.0.2"])
    s.add_dependency(%q<sinatra>, ["~> 1.4.4"])
    s.add_dependency(%q<sinatra-contrib>, ["~> 1.4.2"])
    s.add_dependency(%q<thin>, ["~> 1.6.1"])
    s.add_dependency(%q<rufus-scheduler>, ["~> 2.0.24"])
    s.add_dependency(%q<thor>, ["> 0.18.1"])
    s.add_dependency(%q<sprockets>, ["~> 2.10.1"])
    s.add_dependency(%q<rack>, ["~> 1.5.4"])
    s.add_dependency(%q<rake>, ["~> 10.1.0"])
    s.add_dependency(%q<haml>, ["~> 4.0.4"])
    s.add_dependency(%q<minitest>, ["~> 5.2.0"])
    s.add_dependency(%q<mocha>, ["~> 0.14.0"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.8.2"])
  end
end
