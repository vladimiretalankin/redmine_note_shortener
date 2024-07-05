Redmine::Plugin.register :redmine_note_shortener do

  name 'Redmine Note Shortener plugin'
  author 'Vladimir Talankin'
  description 'A plugin for Redmine that shortens the issues\' incoming notes by hiding excessive text, thus improving the UX. Each user can set their desirable number of characters to be shown. Tested on Redmine 5.1.0'
  version '0.0.1'
  url 'https://github.com/vladimiretalankin/redmine_note_shortener'
  author_url 'https://github.com/vladimiretalankin'
  
  NOTES_CHARS_BEFORE_CUT = 'Number of characters in notes'
  CF_CUT_AFTER_CHARS = custom_field = CustomField.find_by_name(NOTES_CHARS_BEFORE_CUT)&.id
  NOTE_SHORTENER_CF_DESC = 'Number of characters to show in incoming notes. For unabridged notes set the value to 0.'
  
end
