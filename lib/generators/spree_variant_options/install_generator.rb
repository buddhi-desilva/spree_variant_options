module SpreeVariantOptions
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      desc "Installs required migrations for spree_essentials"
      
      def copy_migrations
        rake "spree_variant_options:install:migrations"
      end
      
      def add_javascripts
        append_file "app/assets/javascripts/store/all.js", "//= require spree_variant_options\n"
      end

      def add_stylesheets
        css_stylesheet = Rails.root.join('app', 'assets', 'stylesheets', 'store', 'all.css')
        sass_stylesheet = Rails.root.join('app', 'assets', 'stylesheets', 'store', 'all.css.scss')
        
        # If the files isn't an SASS file, we'll convert it into a SASS file
        stylesheet = File.exists?(sass_stylesheet) ? sass_stylesheet : css_stylesheet
        inject_into_file stylesheet, "*= require spree_variant_options\n", :before => /\*\//, :verbose => true
      end


    end
  end
end
