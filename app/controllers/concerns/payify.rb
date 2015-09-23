module Wirecard
  module Payify
    extend ActiveSupport::Concern
  
    included do
      helper_method :current_payment_parent, :current_payment
    end
  
    def build_current_payment
      @current_payment ||= current_payment_parent.payments.new(payment_params)
    end
  
    alias_method :current_payment, :build_current_payment
  
    def current_payment_parent
      @current_payment_parent ||= if (current_payment_parent = NotificationDelivery.find_active_by_uuid(params[:casefile_id] || params[:id])).payable?
        current_payment_parent
      else
        raise ActiveRecord::RecordNotFound
      end
    end
  
    private
  
    def payment_params
      (permitted_params[:payment] || {}).merge(
        host: [request.protocol, request.host].join,
        order_ident: current_payment_parent.unique_id,
        amount: current_payment_parent.casefile_amount_cents.to_s,
        consumer_ip_address: request.ip,
        consumer_user_agent: request.user_agent,
        currency: current_payment_parent.casefile_amount_currency,
        order_description: current_payment_parent.casefile_description,
        iframe_css_url: current_payment_parent.css_url,
        success_url: casefile_url(id: current_payment_parent.unique_id, page: :success),
        failure_url: casefile_url(id: current_payment_parent.unique_id, page: :failure),
        cancel_url: casefile_url(id: current_payment_parent.unique_id, page: :cancel),
        service_url: casefile_url(id: current_payment_parent.unique_id, page: :service),
        confirm_url: wirecard_casefile_notifications_url(host: 'http://collecto.ngrok.com', casefile_id: current_payment_parent.unique_id),
        return_url: casefile_url(current_payment_parent)
      )
    end

  end
end