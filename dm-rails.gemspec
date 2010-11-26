# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-rails}
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin Gamsjaeger (snusnu)", "Dan Kubb"]
  s.date = %q{2010-11-26}
  s.description = %q{Integrate DataMapper with Rails 3}
  s.email = %q{gamsnjaga@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "dm-rails.gemspec",
     "lib/dm-rails.rb",
     "lib/dm-rails/configuration.rb",
     "lib/dm-rails/mass_assignment_security.rb",
     "lib/dm-rails/middleware/identity_map.rb",
     "lib/dm-rails/railtie.rb",
     "lib/dm-rails/railties/controller_runtime.rb",
     "lib/dm-rails/railties/database.rake",
     "lib/dm-rails/railties/i18n_support.rb",
     "lib/dm-rails/railties/log_listener.rb",
     "lib/dm-rails/railties/log_subscriber.rb",
     "lib/dm-rails/session_store.rb",
     "lib/dm-rails/setup.rb",
     "lib/dm-rails/storage.rb",
     "lib/generators/data_mapper.rb",
     "lib/generators/data_mapper/migration/migration_generator.rb",
     "lib/generators/data_mapper/migration/templates/migration.rb",
     "lib/generators/data_mapper/model/model_generator.rb",
     "lib/generators/data_mapper/model/templates/model.rb",
     "lib/generators/data_mapper/observer/observer_generator.rb",
     "lib/generators/data_mapper/observer/templates/observer.rb",
     "tasks/clean.rake",
     "tasks/yard.rake",
     "tasks/yardstick.rake"
  ]
  s.homepage = %q{http://github.com/datamapper/dm-rails}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{datamapper}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Use DataMapper with Rails 3}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<dm-active_model>, ["~> 1.0.3"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.1.0.beta"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 3.1.0.beta"])
      s.add_runtime_dependency(%q<railties>, ["~> 3.1.0.beta"])
    else
      s.add_dependency(%q<dm-core>, ["~> 1.0.0"])
      s.add_dependency(%q<dm-active_model>, ["~> 1.0.3"])
      s.add_dependency(%q<activesupport>, ["~> 3.1.0.beta"])
      s.add_dependency(%q<actionpack>, ["~> 3.1.0.beta"])
      s.add_dependency(%q<railties>, ["~> 3.1.0.beta"])
    end
  else
    s.add_dependency(%q<dm-core>, ["~> 1.0.0"])
    s.add_dependency(%q<dm-active_model>, ["~> 1.0.3"])
    s.add_dependency(%q<activesupport>, ["~> 3.1.0.beta"])
    s.add_dependency(%q<actionpack>, ["~> 3.1.0.beta"])
    s.add_dependency(%q<railties>, ["~> 3.1.0.beta"])
  end
end

