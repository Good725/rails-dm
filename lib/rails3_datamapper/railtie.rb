require 'dm-core'
require 'dm-active_model'

require 'rails'
require 'active_model/railtie'

# Comment taken from active_record/railtie.rb
#
# For now, action_controller must always be present with
# rails, so let's make sure that it gets required before
# here. This is needed for correctly setting up the middleware.
# In the future, this might become an optional require.
require 'action_controller/railtie'

require 'rails3_datamapper/setup'
require "rails3_datamapper/railties/subscriber"
require "rails3_datamapper/railties/routing_support"


module Rails
  module DataMapper

    class Railtie < Rails::Railtie

      railtie_name :data_mapper

      subscriber ::DataMapper::Railties::Subscriber.new

      config.generators.orm :data_mapper, :migration => true


      # Support overwriting crucial steps in subclasses


      def configure_data_mapper(app)
        app.config.data_mapper.configuration = Rails::DataMapper::Configuration.for(
          app.config.database_configuration
        )
      end

      def setup_adapter_cascade(app)
        app.config.data_mapper.configuration.adapter_cascade.configure do |cascade|
          cascade.use Rails::DataMapper::Adapters::BenchmarkingAdapter
        end
      end

      def setup_routing_support(app)
        ::DataMapper::Model.append_inclusions(Rails::DataMapper::RoutingSupport)
      end

      def setup_controller_runtime(app)
        require "rails3_datamapper/railties/controller_runtime"
        ActionController::Base.send :include, Rails::DataMapper::Railties::ControllerRuntime
      end

      def setup_identity_map(app)
        if app.config.data_mapper.configuration.identity_map
          require 'rails3_datamapper/middleware/identity_map'
          app.config.middleware.use Rails::DataMapper::Middleware::IdentityMap
        end
      end

      def setup_logger(app, logger)
        Rails::DataMapper.setup_logger(logger)
      end

      module Setup

        def setup_data_mapper(app)
          load_plugins(app)
          preload_lib(app)
          preload_models(app)
          Rails::DataMapper.setup(Rails.env)
        end

        def load_plugins(app)
          app.config.data_mapper.configuration.plugins.each do |plugin|
            require plugin.to_s
          end
        end

        def preload_lib(app)
          app.config.paths.lib.each do |path|
            Dir.glob("#{path}/**/*.rb").sort.each do |file|
              require file unless file.match(/#{path}\/generators\/*/)
            end
          end
        end

        def preload_models(app)
          app.config.paths.app.models.each do |path|
            Dir.glob("#{path}/**/*.rb").sort.each { |file| require file }
          end
        end

      end

      extend Setup


      initializer 'data_mapper.configuration' do |app|
        configure_data_mapper(app)
      end

      initializer 'data_mapper.logger' do |app|
        setup_logger(app, Rails.logger)
      end

      initializer 'data_mapper.adapter_cascade' do |app|
        setup_adapter_cascade(app)
      end

      initializer 'data_mapper.routing_support' do |app|
        setup_routing_support(app)
      end

      # Expose database runtime to controller for logging.
      initializer "data_mapper.log_runtime" do |app|
        setup_controller_runtime(app)
      end

      initializer 'data_mapper.setup_identity_map' do |app|
        setup_identity_map(app)
      end

      # Run setup code after_initialize to make sure all config/initializers
      # are in effect once we setup the connection. This is especially necessary
      # for the cascaded adapter wrappers that need to be declared before setup.

      config.after_initialize do |app|
        setup_data_mapper(app)
      end

      rake_tasks do
        load 'rails3_datamapper/railties/database.rake'
      end

    end

  end
end
