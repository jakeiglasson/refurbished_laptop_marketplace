RailsAdmin.config do |config|

  config.parent_controller = 'ApplicationController'

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.is_admin?
  end

  # config.authorize_with do
  #   if user_signed_in?
  #     redirect_to main_app.root_path unless current_user.admin == true
  #   else
  #     redirect_to main_app.root_path
  #   end
  # end

  ### Popular gems integration

  # This is needed so that cancancan has access to user params  
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_or_guest_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

  end

  config.model "Laptop" do
    list do

      #Manually enable/disable per field
      field :id do
        filterable true
      end
      field :user_id do
        filterable true
      end
      field :laptop_brand_id do
        filterable true
      end
      field :grade_id do
        filterable true
      end
      field :cpu_id do
        filterable true
      end
      field :ram_id do
        filterable true
      end
      field :hard_drive_id do
        filterable true
      end
      field :model do
        filterable true
      end
      field :price do
        filterable true
      end
      field :created_at do
        filterable true
      end
      field :updated_at do
        filterable true
      end
      field :sold_status do
        filterable true
      end


      # field ":user" do
      #   filterable true
      # end


    end

  end
end
