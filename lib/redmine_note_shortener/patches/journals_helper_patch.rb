require_dependency 'journals_helper'

module RedmineNoteShortener
    module Patches
      module JournalsHelperPatch
          def self.included(base) # :nodoc:
               base.send(:include, InstanceMethods)
               base.class_eval do
                  unloadable # Send unloadable so it will not be unloaded in development
                  alias_method :render_notes_without_cut, :render_notes
                  alias_method :render_notes, :render_notes_with_cut
               end
           end

        module InstanceMethods
            def render_notes_with_cut(issue, journal, options={})
              chars_to_show = User.current.custom_values.where(custom_field_id: CF_CUT_AFTER_CHARS).to_a.try(:[], 0)&.value.to_i
              if chars_to_show > NOTES_MINIMUM_CHARS && journal[:notes].size > chars_to_show 
                text = journal[:notes].slice(0,chars_to_show) + " <...>"
              else
                text = journal[:notes]
              end
              content_tag('div', textilizable(text), :id => "journal-#{journal.id}-notes", :class => "wiki")
            end
        end
      end
    end
end
JournalsHelper.send(:include, RedmineNoteShortener::Patches::JournalsHelperPatch)
