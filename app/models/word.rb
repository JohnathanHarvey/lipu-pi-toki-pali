class Word < ApplicationRecord
  belongs_to :conlang

  # broadcasts_to :words, target: self, partial: "conlangs/words/word_tr", locals: { word: self }
  after_update_commit -> {
    broadcast_replace_to :words,
      target: "word_#{self.id}",
      partial: "conlangs/words/word_tr",
      locals: { word: self }
  }

  after_create_commit -> {
    broadcast_append_to :words,
      target: :words_table,
      partial: "conlangs/words/word_tr",
      locals: { word: self }
    broadcast_remove_to :words,
      target: :word_new
    broadcast_append_to :words,
      target: :words_table,
      partial: "conlangs/words/form",
      locals: { conlang: self.conlang, word: nil }
  }

  after_destroy_commit -> {
    broadcast_remove_to :words,
      target: "word_#{self.id}"
  }

  def new_form
    broadcast_append_to :words,
      partial: "conlangs/words/form",
      locals: { conlang: self.conlang, word: self }
  end

  def edit_form
    broadcast_replace_to :words,
      target: "word_#{self.id}",
      partial: "conlangs/words/form",
      locals: { conlang: self.conlang, word: self }
  end
end
