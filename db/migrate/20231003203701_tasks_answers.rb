class TasksAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks_answers, id: false do |t|
      t.belongs_to :task
      t.belongs_to :answer
    end
  end
end
