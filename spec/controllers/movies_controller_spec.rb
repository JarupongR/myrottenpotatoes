require 'rails_helper'

describe MoviesController, :type => :controller do
  
  describe 'searching TMDb' do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it 'calls the model method that performs TMDb search' do
      expect(Movie).to receive(:find_in_tmdb).with('hardware').
        and_return(@fake_results)
        post :search_tmdb, params: {:search_terms => 'hardware'}
    end
    describe 'after valid search' do
      before :each do
        allow(Movie).to receive(:find_in_tmdb).and_return(@fake_results)
        post :search_tmdb, params: {:search_terms => 'hardware'}
      end
      it 'selects the Search Results template for rendering' do
        expect(response).to render_template('result_search_tmdb')
      end
      it 'makes the TMDb search results available to that template' do
        expect(assigns(:search)).to eq(@fake_results)
      end
    end
  end


  describe 'adding rottenpotatoes movie' do
    before :each do
      get :new
    end
    it 'selects the movie>>new template for rendering' do
      expect(response).to render_template('new')
    end

    it 'count rottenpotatoes movie before adding a dummy one' do
      expect(Movie.count).to eq 0
    end

    describe 'adding detail to create movie' do
      before :each do
        post :create, params: {
        movie: {
          :title => 'Rush hour',
          :rating => 'PG-13',
          :release_date => '1998-09-18', 
          :description => 'Hong Kong Detective and LAPD'
          }
        }
      end
      it 'redirect to the movie>>show template for rendering' do
        expect(response).to redirect_to(:controller => 'movies', :action => 'show', :id => 1)
      end

      it 'count rottenpotatoes movie after adding a dummy one' do
        expect(Movie.count).to eq 1
      end

      it 'makes added rottenpotatoes movie results available to template' do
        expect(assigns(:movie)).to have_attributes(
          :title => 'Rush Hour',
          :rating => 'PG-13',
          :release_date => DateTime.parse('1998-09-18'), 
          :description => 'Hong Kong Detective and LAPD'
        )
      end
    end
  end


  describe 'editing rottenpotatoes movie' do
    before :each do
      @movie = FactoryGirl.create(
        :movie, :title => 'The Blind Side',
        :rating => 'PG',
        :release_date => '2009-11-20', 
        :description => 'Great American footballer with great family')
      get :edit, params: {:id => @movie.id}
    end
    it 'selects the movie>>edit template for rendering' do
      expect(response).to render_template('edit')
    end
    it 'check editing rottenpotatoes movie available to that template' do
      expect(assigns(:movie)).to have_attributes(
        :title => 'The Blind Side',
        :rating => 'PG',
        :release_date => DateTime.parse('2009-11-20'), 
        :description => 'Great American footballer with great family'
      )
    end

    describe 'change the detail of selected rottenpotatoes movie' do
      before :each do
        put :update, params:{
          :id => @movie.id,  
          :movie => { 
            :title => 'The Blind Side',
            :rating => 'PG-13',
            :release_date => '2009-11-20', 
            :description => 'Great American footballer with great family'}
        }
      end
      it 'redirect to the movie>>show template for rendering' do
        expect(response).to redirect_to(:controller => 'movies', :action => 'show', :id => @movie.id)
      end
      it 'check updated rottenpotatoes movie available to that template' do
        expect(assigns(:movie)).to have_attributes(
          :title => 'The Blind Side',
          :rating => 'PG-13',
          :release_date => DateTime.parse('2009-11-20'), 
          :description => 'Great American footballer with great family'
        )
      end
    end  
  end

  describe 'deleting rottenpotatoes movie' do
      before :each do
        @movie = FactoryGirl.create(
          :movie, :title => 'The Martian',
          :rating => 'PG-13',
          :release_date => '2015-09-30', 
          :description => 'Great man with fighting heart')
      end
      it 'count rottenpotatoes movie after create a dummy one' do
        expect(Movie.count).to eq 1
      end

      describe 'delete the selected rottenpotatoes movie' do
        before :each do
          delete :destroy, params: {:id => @movie.id}
        end
        it 'count rottenpotatoes movie after delete a dummy one' do
          expect(Movie.count).to eq 0
        end
      end
  end
end
