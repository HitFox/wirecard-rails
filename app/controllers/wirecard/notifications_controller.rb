module Wirecard
  class NotificationsController < ApplicationController
  
    #
    # Concerns
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #
  
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
  
    skip_before_action :verify_authenticity_token
  
    before_action :authenticate!

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
  
    def create
      build_resource
    
      if @notification.save
        render json: { status: 'OK', errorCodes: 'null', 'QPAY-CONFIRMATION-RESPONSE' => { result: 'OK'} }
      else
        render json: { status: 'NOK', errorCodes: '1', 'QPAY-CONFIRMATION-RESPONSE' => { result: 'NOK', message: @notification.errors.full_messages.join('; ') } }
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
  
    def parent
      @parent ||= if (parent = NotificationDelivery.find_active_by_uuid(params[:casefile_id]))
        parent
      else
        raise ActiveRecord::RecordNotFound
      end
    end
  
    def build_resource
      @notification ||= parent.payments.by_status(:pending).find_by(order_number: params[:orderNumber]).notifications.new(notification_params)
    end
  
    #
    # Private
    # ---------------------------------------------------------------------------------------
    #
    #
    #
    #
  
    private
  
    def callback
      @callback ||= Wirecard::Callback.new(callback_params)
    end
  
    def authenticate!
      render json: { status: 'NOK', errorCodes: '1', 'QPAY-CONFIRMATION-RESPONSE' => { result: 'NOK', message: 'INVALID_FINGERPRINT' } } unless callback.fingerprint_valid?
    end
  
    def callback_params
      params.except(:action, :controller, :locale, :casefile_id)
    end
  
    def notification_params
      callback.to_hash
    end
  
  end  
end
