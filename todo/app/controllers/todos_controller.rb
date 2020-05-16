class TodosController < ApplicationController
  def index
    todos = TodoModel.order("created_at DESC")
    render json: todos
  end

  def create
    todo = TodoModel.create(todo_param)
    render json: todo
  end

  def update
    todo = TodoModel.find(params[:id])
    todo.update_attributes(todo_param)
    render json: todo
  end

  def destroy
    todo = TodoModel.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end
  
  private
    def todo_param
      params.require(:todo).permit(:title, :done)
    end
end
