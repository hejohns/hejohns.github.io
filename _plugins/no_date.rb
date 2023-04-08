# https://stackoverflow.com/a/68287682
class Jekyll::PostReader
  # monkey patch `Jekyll::PostReader::read_posts` so we don't have to write the
  # date in the post filename
  #
  # see the jekyll source
  def read_posts(dir)
    read_publishable(dir, "_posts", Jekyll::Document::DATELESS_FILENAME_MATCHER)
  end
end
