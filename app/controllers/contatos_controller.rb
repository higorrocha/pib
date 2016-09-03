class ContatosController < ApplicationController
	def new
		@contato = Contato.new
	end

	def create
		@contato = Contato.new(params[:contato])
	    @contato.request = request
	    if @contato.deliver
	      flash.now[:error] = nil
	    else
	      flash.now[:error] = 'Não foi possível enviar a mensagem.'
	      render :new
	    end
	end
end
