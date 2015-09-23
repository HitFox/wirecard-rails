module Wirecard
  class PaymentsController < Application
  
    #
    # Concerns
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #
  
    include Payify
  
    #
    # Settings
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #
  
    #
    # Filter
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #

    #
    # Plugins
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #
  
    #
    # Actions
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #
  
    def new
      build_current_payment
    end
  
    def create
      build_current_payment
    
      case current_payment.payment_type
        when 'CCARD' then persist_creditcard 
        else persist_payment
      end
    end
  
    #
    # Instance Methods
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #

    #
    # Protected
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #

    protected
  
    def persist_creditcard
      respond_to do |format|
        format.json do
          if current_payment.save
            render json: { redirect_url: current_payment.redirect_url }
          else
            render json: { errors: current_payment.errors.full_messages }
          end
        end
      end
    end
  
    def persist_payment
      if current_payment.save
        redirect_to current_payment.redirect_url
      else
        flash[:alert] = t('.alert')
        render action: :new
      end
    end
  
    #
    # Private
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #
  
    private
  
    def permitted_params    
      params.permit(payment: [:payment_type, :storage_id])
    end
  
  end
  
end