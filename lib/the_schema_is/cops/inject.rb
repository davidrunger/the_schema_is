# frozen_string_literal: true

module TheSchemaIs::Cops
end

# copy-paste from https://github.com/rubocop-hq/rubocop-rspec/blob/master/lib/rubocop/rspec/inject.rb
# ...and other projects in rubocop-hq :shrug:
# Because RuboCop doesn't yet support plugins, we have to monkey patch in a
# bit of our configuration.
module TheSchemaIs::Cops::Inject
  def self.defaults!
    path = File.expand_path('../../../config/defaults.yml', __dir__)
    hash = RuboCop::ConfigLoader.__send__(:load_yaml_configuration, path)
    config = RuboCop::Config.new(hash, path)
    puts "configuration from #{path}" if RuboCop::ConfigLoader.debug?
    config = RuboCop::ConfigLoader.merge_with_default(config, path)
    RuboCop::ConfigLoader.instance_variable_set(:@default_configuration, config)
  end
end
