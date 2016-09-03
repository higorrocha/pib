class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@messages = Message.all.order("created_at desc").paginate(page: params[:page], per_page: 5)
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new message_params

		if @message.save
			redirect_to @message, notice: "Sua mensagem foi salva com sucesso!"
		else
			render 'new', notice: "Ops! Eu não pude salvar sua mensagem."
		end
	end

	def show
	end

	def update
		if @message.update message_params
			redirect_to @message, notice: "Sua mensagem foi salva com sucesso!"
		else
			render 'edit'
		end
	end

	def destroy
		@message.destroy
		redirect_to messages_path
	end

	private

	def message_params
		params.require(:message).permit(:title, :content, :slug, :image)
	end

	def find_message
		@message = Message.friendly.find(params[:id])
	end
end
