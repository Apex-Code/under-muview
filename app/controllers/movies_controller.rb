class MoviesController < ApplicationController
 
  before_action :find_movie, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]


  def index
  	@movies = Movie.all.order("created_at DESC") 
  end
  
  def show
    @reviews = @movie.reviews.all.order("created_at DESC")
  end

  def new
  	@movie = current_user.movies.build
  end

  def create
  	@movie = current_user.movies.build(movie_params)
  	if @movie.save
  	  redirect_to movie_path(@movie), notice: "Your addition is appreciated!"
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
  	if @movie.update(movie_params)
      redirect_to @movie, notice: "Your update was successful!"
    else
      render 'edit'	
    end
  end

  def destroy
  	@movie.destroy 
  	  redirect_to root_path, notice: "It's as if this movie never existed!"
  end

private
  
  def find_movie
  	@movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :director, :length, :rating, :image)
  end
end
