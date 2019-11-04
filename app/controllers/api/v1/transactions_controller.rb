module Api
  module V1
    class TransactionsController < ApplicationController
      protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }
      before_action :set_transaction, only: [:show, :edit, :update, :destroy]

      # GET /transactions
      # GET /transactions.json
      def index
        @transactions = Transaction.all
        render json: @transactions
      end

      # GET /transactions/1
      # GET /transactions/1.json
      def show
        render json: @transaction
      end

      # GET /transactions/new
      def new
        @transaction = Transaction.new
        render json: @transaction
      end

      # GET /transactions/1/edit
      def edit
        render json: @transaction
      end

      # POST /transactions
      # POST /transactions.json
      def create
        @transaction = Transaction.new(transaction_params)

        if @transaction.save
          render json: @transaction, status: :created, location: @transaction
        else
          render json: @transaction.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /transactions/1
      # PATCH/PUT /transactions/1.json
      def update
        if @transaction.update(transaction_params)
          render :show, status: :ok, location: @transaction
        else
          render json: @transaction.errors, status: :unprocessable_entity
        end
      end

      # DELETE /transactions/1
      # DELETE /transactions/1.json
      def destroy
        @transaction.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_transaction
          @transaction = Transaction.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def transaction_params
          params.require(:transaction).permit(:sender_id, :recipient_id, :balance, :note)
        end
    end
  end
end
