require_relative './save_data'

module PopulateAuthors
  include SaveData

  def populate_authors
    authors_array = []
    json_authors = retrieve_data('authors')
    json_authors.each do |author|
      new_author = Author.new(author['author']['first_name'], author['author']['last_name'])
      new_author.change_id(author['author']['id'])
      authors_array << new_author
    end
    authors_array
  end
end
