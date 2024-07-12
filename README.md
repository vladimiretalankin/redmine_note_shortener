# redmine_note_shortener
A small plugin that improves user experience and speeds up loading of Issue pages by hiding out notes' text that exceeds the given number of characters. Each user can set their preferable number of characters to display.

### Install 

1. Download plugin and copy plugin folder redmine_note_shortener to Redmine's plugins folder 

2. perform migrations

go to Redmine root folder and run command:

`RAILS_ENV=production bundle exec rake redmine:plugins:migrate`

3. restart Redmine

### Uninstall

1. go to Redmine root folder and run command:

`RAILS_ENV=production bundle exec rake redmine:plugins:migrate NAME=redmine_note_shortener VERSION=0`

2. restart Redmine

### Use

On 'My account' page (the link to which is usually near the upper-right corner) put the desirable number of displayable characters into the field 'Number of characters in notes'.

Type any number below 30 for unabridged notes. Press the 'Save' button. Changes can then be seen upon (re)loading any issue with sufficiently long notes. Restarting Redmine is not needed.

### Localizations

* English
* (More to be added)
