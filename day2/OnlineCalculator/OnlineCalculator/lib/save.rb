class Save
  def save_to_file data
      IO.write("result.txt",data)
  end
end