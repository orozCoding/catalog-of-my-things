require_relative 'save_data'

module PopulateLabels
  include SaveData

  def populate_labels
    labels_array = []
    json_labels = retrieve_data('labels')
    json_labels.each do |label|
      new_label = Label.new(label['label']['title'], label['label']['color'])
      new_label.change_id(label['label']['id'])
      labels_array << new_label
    end
    labels_array
  end
end
