module ApplicationHelper
  def words_table conlang
    render partial: "conlangs/words/words_table", locals: { conlang: conlang }
  end

  def phonology conlang
    render partial: "conlangs/phonology", locals: { conlang: conlang }
  end

  def word_tr word
    render partial: "conlangs/words/word_tr", locals: { word: word }
  end

  def new_word_form conlang, word=nil
    render partial: "conlangs/words/form", locals: { conlang: conlang, word: word }
  end
end
