class MoviesController < ApplicationController

  def index
  	@movies = Movie.all.order("created_at DESC") 
  end
  
  def show
  end

  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.create(movie_params)
  	if @movie.save
  	  redirect_to movie_path(@movie)
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
  	if @movie.update
      redirect_to movie_path(@movie)
    else
      render 'edit'	
    end
  end

  def destroy
  end
end
