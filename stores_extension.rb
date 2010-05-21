# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class StoresExtension < Spree::Extension
  version "0.1"
  description "Spree Stores Extension"
  url "http://github.com/teeparhame/spree-stores"

  # Please use stores/config/routes.rb instead for extension routes.

  def self.require_gems(config)
    config.gem 'fastercsv'
    config.gem 'geokit'
    config.gem 'ym4r'    
  end

  
  def activate

    AppConfiguration.class_eval do
      preference :javascript, :string, :default => 'clusterer,geoRssOverlay,markerGroup,wms-gs,ym4r-gm'
    end

    ApplicationHelper.class_eval do
      def store_selection
        Store.find(:all).collect{|st| [st.name, st.id]}.unshift([" -- choose store -- ", ""])
      end

      def event_type_selection
        [[" -- choose type -- ", ""],["Monthly", 1],["Ongoing", 2],["Special", 3],["Save The Date", 4]]
      end

      def monthname(monthnumber)
        if monthnumber
          Date::MONTHNAMES[monthnumber]
        end
      end
    end
  end

end
