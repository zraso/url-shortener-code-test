require 'url_entry'

describe URLEntry do

  describe '#short_url' do
    it 'generates a string with 5 characters' do
      expect(subject.short_url.length).to eq 5
    end

    it 'each string is unique' do
      short_url_1 = subject.short_url
      short_url_2 = subject.short_url
      expect(short_url_1).not_to equal short_url_2
    end
  end
  
end