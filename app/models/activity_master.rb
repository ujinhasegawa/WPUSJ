class ActivityMaster < ApplicationRecord
  enum group: { bible: 0, divine_principle: 1, father_message: 2, faith: 3, practice: 4 }
end
