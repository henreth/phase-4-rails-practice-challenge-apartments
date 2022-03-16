class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
      tenants = Tenant.all 
      render json: tenants
    end
  
    def show
      tenant = Tenant.find(params[:id])
      render json: tenant
    end
  
    private
  
    def render_not_found_response
      render json: { error: "Tenant not found" }, status: :not_found
    end
  
end
