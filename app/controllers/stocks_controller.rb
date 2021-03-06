class StocksController < ApplicationController
    
    def search
        #byebug
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            #render json: @stock
            #byebug
            if @stock
                respond_to do |format|
                    format.js { render partial: 'users/result'}
                end
            else
                respond_to do |format|
                    flash.now[:alert]="Please enter a valid symbol"
                    format.js { render partial: 'users/result'}
                end
                
            end
        else
            respond_to do |format|
                flash.now[:alert]="Please enter symbol"
                format.js { render partial: 'users/result'}
            end
        end
    end
end
