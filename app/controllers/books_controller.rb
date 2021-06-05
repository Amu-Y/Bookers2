class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
     @user = current_user
     @books = Book.all
     render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    to  = Time.current.at_end_of_day
    from  = (to - 6.day).at_beginning_of_day
    @all_ranks  = Book.all.sort {|a,b| b.favorites.where(created_at: from...to).count <=> a.favorites.where(created_at: from...to).count}
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @bookers = Book.new
    @book_comment = BookComment.new

  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path, alert: 'error'
    end
  end

  def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
  else
    render :edit
  end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    redirect_to books_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
