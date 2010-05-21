class StoresHooks < Spree::ThemeSupport::HookListener

   insert_after(:admin_tabs) do
     '<%= tab(:stores, :store_people, :store_events) %>'
   end

end
