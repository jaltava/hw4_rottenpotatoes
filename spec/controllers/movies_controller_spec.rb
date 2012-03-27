require 'spec_helper'

describe MoviesController do

  describe 'search by director' do
    before :each do
      @fake_results = [mock('Movie'), mock('Movie')]
    end

    it 'should call the model method that search by director' do
      Movie.should_receive(:find_similar_movies).with('1').
        and_return(@fake_results)
      get :search_similar_movies, :id => 1
    end

    describe 'after valid search' do
      before :each do
        Movie.stub(:find_similar_movies).and_return(@fake_results)
        get :search_similar_movies, :id => 1
      end

      it 'should select the Search Results template for rendering' do
        response.should render_template('index')
      end

      it 'should make the search results available to that template' do
        assigns(:movies).should == @fake_results
      end

    end

  end

end
