class WordsController < ApplicationController
  before_action :set_word, only: %i[ show edit update destroy ]
  # before_action :set_conlang, only: %i[ create, edit ]

  def index
    @words = Word.all
  end

  def show
  end

  def new
    @word = Word.new
  end

  def edit
    @word.edit_form

    render html: ""
  end

  def create
    @word = Conlang
              .find_by(params[:word][:conlang_id])
              .words
              .new(word_params)
    @word.save
  end

  def update
    if @word.update(word_params)
      # @word.remove_form
    end
  end

  def destroy
    @word.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # def set_conlang
    #   @conlang = Conlang.find(params[:word][:conlang_id])
    # end

    # Only allow a list of trusted parameters through.
    def word_params
      params.fetch(:word, {}).permit(:text, :english, :conlang_id)
    end
end
