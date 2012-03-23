module ApplicationHelper
  def search_typeahead_datasource
    datasource = Book::book_titles + Author::author_names
    datasource.to_json
  end
end
