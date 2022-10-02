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
  }

  after_destroy_commit -> {
    broadcast_remove_to :words,
      target: "word_#{self.id}"
  }

  def replace_form
    broadcast_replace_to :words,
      target: "word_#{self.id}",
      partial: "conlangs/words/form"
  end

  def replace_tr
    broadcast_replace_to :words,
      target: "word_#{self.id}",
      partial: "conlangs/words/form",
      locals: { conlang: self.conlang, word: self }

  end
end
