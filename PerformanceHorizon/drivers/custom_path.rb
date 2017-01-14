class CustomPath


  def get_file_path
    return File.expand_path(File.dirname(__FILE__))
  end
end