class Message < ApplicationRecord
  # 1. This line broadcasts a Turbo Stream to all subscribers whenever a message is created
  # It uses the "messages" stream name, which we'll subscribe to in our views
  broadcasts_to ->(message) { :messages }
  
  # 2. Alternative way to broadcast with more control:
  # after_create_commit -> { broadcast_append_to :messages }
  # after_update_commit -> { broadcast_replace_to :messages }
  # after_destroy_commit -> { broadcast_remove_to :messages }
  
  # 3. Or you could use the shorthand for all three callbacks:
  # broadcasts
end
