# spec/models/movie_spec.rb:

require 'factory_girl_rails'
require 'rails_helper.rb'

describe Movie do
    it 'should include rating and year in full name' do
      # 'build' creates but doesn't save object; 'create' also saves it
      movie = FactoryGirl.build(:movie, :title => 'Milk', :rating => 'R')
      expect(movie.name_with_rating).to eq 'Milk (R)'
    end
end