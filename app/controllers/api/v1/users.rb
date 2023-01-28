module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc "Return a user"
        params do
          requires :id, type: Integer, desc: "ID of the user"
        end
        get ":id", root: "user" do
          User.where(id: permitted_params[:id]).first!
        end

        desc "Return a user boards"
        params do
          requires :id, type: Integer, desc: "ID of the user"
        end
        get ':id/boards', root: 'user' do
          User.where(id: permitted_params[:id]).first!.boards
        end

        desc 'Return a user board'
        params do
          requires :id, type: Integer, desc: 'ID of the user'
          requires :board_id, type: Integer, desc: 'ID of the board'
        end
        get ':id/boards/:board_id', root: 'user' do
          User.where(id: permitted_params[:id]).first!.boards.detect { |board| board.id == permitted_params[:board_id] }
        end

        desc 'Return a board tasks'
        params do
          requires :id, type: Integer, desc: 'ID of the user'
          requires :board_id, type: Integer, desc: 'ID of the board'
        end
        get ':id/boards/:board_id/tasks', root: 'user' do
          User.where(id: permitted_params[:id]).first!.boards.detect { |board| board.id == permitted_params[:board_id] }.tasks
        end

        desc 'Return a board task'
        params do
          requires :id, type: Integer, desc: 'ID of the user'
          requires :board_id, type: Integer, desc: 'ID of the board'
          requires :task_id, type: Integer, desc: 'ID of the task'
        end
        get ':id/boards/:board_id/tasks/:task_id', root: 'user' do
          User.where(id: permitted_params[:id])
              .first!
              .boards
              .detect { |board| board.id == permitted_params[:board_id] }
              .tasks
              .detect { |task| task.id == permitted_params[:task_id] }
        end
      end
    end
  end
end
