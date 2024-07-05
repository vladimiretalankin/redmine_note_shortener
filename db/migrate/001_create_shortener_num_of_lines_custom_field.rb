class CreateShortenerNumOfLinesCustomField  < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]

  def up
    custom_field = CustomField.find_by_name(NOTES_CHARS_BEFORE_CUT)
    return if custom_field

    custom_field = CustomField.new_subclass_instance(
      'UserCustomField',
      {
        :name => NOTES_CHARS_BEFORE_CUT,
        :field_format => :int,
        :default_value => 0,
        :visible => true,
        :editable => true,
        :is_required => false,
        :regexp => '',
        :is_filter => false,
        :description => NOTE_SHORTENER_CF_DESC
      }
    )

    custom_field.save!
  end

  def down
    custom_field = CustomField.find_by_name(NOTES_CHARS_BEFORE_CUT)
    custom_field.destroy if custom_field
  end

end
