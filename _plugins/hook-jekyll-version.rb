Jekyll::Hooks.register :site, :after_init do |site|
  site.config['ruby-version'] = RUBY_DESCRIPTION
  site.config['jekyll-version'] = Gem.loaded_specs['jekyll'].version.version
end
