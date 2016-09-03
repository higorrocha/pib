class LiderancasController < ApplicationController
	before_action :find_lideranca, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@liderancas = Lideranca.all.order("created_at desc")
	end

	def new
		@lideranca = Lideranca.new
	end

	def create
		@lideranca = Lideranca.new lideranca_params

		if @lideranca.save
			redirect_to @lideranca, notice: "Adicionado com sucesso!"
		else
			render 'new', notice: "Ops! Eu não pude adicionar."
		end
	end

	def show
	end

	def update
		if @lideranca.update lideranca_params
			redirect_to @lideranca, notice: "Adicionado com sucesso!"
		else
			render 'edit'
		end
	end

	def destroy
		@lideranca.destroy
		redirect_to liderancas_path
	end

	private

	def lideranca_params
		params.require(:lideranca).permit(:title, :content, :slug, :image)
	end

	def find_lideranca
		@lideranca = Lideranca.friendly.find(params[:id])
	end
end
