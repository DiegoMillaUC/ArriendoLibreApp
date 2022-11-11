class Message < ActiveRecord::Base
    belongs_to :conversation
    belongs_to :usuario

    validates_presence_of :body, :conversation_id, :usuario_id

    def message_time
        created_at.strftime("%m/%d/%y at %l:%M %p")
    end
end