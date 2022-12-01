require 'rails_helper'

RSpec.describe "Songs Index", type: :feature do

  # As a user,
  # When I visit 

  describe "As a user," do
    describe "when I visit /songs," do 
      it "I see each song's title and play count" do 
        carly = Artist.create(name: 'Carly Rae Jepson')
        song_1 = carly.songs.create!( title: "I Really Like You", 
                                      length: 208, 
                                      play_count: 2456357, 
                                      artist: carly
                                      )
        song_2 = carly.songs.create!( title: "Call Me Maybe", 
                                      length: 207, 
                                      play_count: 1214722172, 
                                      artist: carly
                                      )
        visit "/songs"
        expect(page).to have_content(song_1.title)
        expect(page).to have_content("Play Count: #{song_1.play_count}")
        expect(page).to have_content(song_2.title)
        expect(page).to have_content("Play Count: #{song_2.play_count}")
      end
    end
  end
end