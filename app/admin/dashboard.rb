ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    div class: "blank_slate_container" do
      h1 do
        "Hundessohn Administrative Panel"
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Products" do
          ul do
            Product.order(created_at: :desc).limit(5).map do |product|
              li link_to(product.name, admin_product_path(product))
            end
          end
        end
      end

      column do
        panel "Etiquette" do
          li "Remember to leave a comment describing any edits you make"
          li "Please only make edits after getting permission from management"
          li "Any update without a comment will lead to some sort of action. We need a paper trail if this is to be an open operation"
        end
      end
    end
  end # content
end
