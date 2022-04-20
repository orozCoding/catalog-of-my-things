require 'json'

module SaveData
  def retrieve_data(path)
    return [] unless File.exist?("./data/#{path}.json")

    read_file("./data/#{path}.json")
  end

  def read_file(file_name)
    file_data = File.read(file_name)
    JSON.parse(file_data, create_additions: true)
  end

  def save_files(array, file_name)
    File.write("#{file_name}.json", JSON[array])
  end

  def persist_data(array, file_name)
    Dir.mkdir('./data') unless Dir.exist?('./data')
    save_files(array, file_name) unless array.empty?
  end
end
