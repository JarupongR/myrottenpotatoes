# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController

  skip_before_action :authenticate!, only: [ :show, :index ]

    def index
      @movies = Movie.all.order(:title)
    end

    def show
        id = params[:id] # retrieve movie ID from URI route
        @movie = Movie.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
        if @current_user
          @review = @movie.reviews.find_by(:moviegoer_id => @current_user.id)
        end
        render(:partial => 'movie_detail_popup', :object => @movie) if request.xhr?
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
          flash[:notice] = "#{@movie.title} was successfully created."
          redirect_to movie_path(@movie)
        else
          render 'new' # note, 'new' template can access @movie's field values!
        end
    end

    def edit
        @movie = Movie.find params[:id]
    end

    def update
        @movie = Movie.find params[:id]
        if @movie.update(movie_params)
          flash[:notice] = "#{@movie.title} was successfully updated."
          redirect_to movie_path(@movie)
        else
          render 'edit' # note, 'edit' template can access @movie's field values!
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted."
        redirect_to movies_path
    end

    def movies_with_filters
      @movies = Movie.with_good_reviews(params[:threshold])
      %w(for_kids with_many_fans recently_reviewed).each do |filter|
        @movies = @movies.send(filter) if params[filter]
      end
    end

    def search_tmdb
      @search_terms = params[:search_terms]
      @search_terms = " " if @search_terms  == ""
      @search = Tmdb::Movie.find(@search_terms)
  
      if @search != []
        render "result_search_tmdb"
      else
        flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
        redirect_to movies_path
      end
    end
  
    def result_search_tmdb
      id = params[:id]
      @movie = Movie.find(id)
      render(:partial => 'movie', :object => @movie) if request.xhr?
    end

    private
      def movie_params
        params.require(:movie).permit(:title, :rating, :release_date, :description)
      end

  end