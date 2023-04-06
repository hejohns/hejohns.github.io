# https://stackoverflow.com/a/68287682
class Jekyll::PostReader
  # Don't use DATE_FILENAME_MATCHER so we don't need to put those stupid dates
  # in the filename. Also limit to just *.markdown, so it won't process binary
  # files from e.g. drags.
  def read_posts(dir)
    read_publishable(dir, "_posts", Jekyll::Document::DATELESS_FILENAME_MATCHER)
  end
end
