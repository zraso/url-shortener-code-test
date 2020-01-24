# frozen_string_literal: true

require 'url_entry'

describe URLEntry do
  let(:url_entry) { described_class.new('www.farmdrop.com') }

  describe '#short_url' do
    it 'generates a string with 5 characters' do
      expect(url_entry.short_url.length).to eq 5
    end

    it 'each string is unique' do
      short_url1 = url_entry.short_url
      short_url2 = url_entry.short_url
      expect(short_url1).not_to equal short_url2
    end
  end

  describe '#json_response' do
    it 'returns data in the correct format' do
      allow(url_entry).to receive(:short_url) { '12abc' }
      expect(url_entry.json_response).to include 'http://www.farmdrop.com'
    end

    it 'saves entry to data hash' do
      allow(url_entry).to receive(:short_url) { '12abc' }
      url_entry.json_response
      expect(URLEntry.data['12abc']).to eq ['http://www.farmdrop.com', 0]
    end
  end

  describe '#self.retrieve' do
    it 'given a short url string, it finds the full url' do
      allow(url_entry).to receive(:short_url) { '12abc' }
      url_entry.json_response
      expect(URLEntry.retrieve('12abc')).to eq 'http://www.farmdrop.com'
    end

    it 'adds to the counter when a short url is accessed' do
      allow(url_entry).to receive(:short_url) { '12abc' }
      url_entry.json_response
      URLEntry.retrieve('12abc')
      expect(URLEntry.data['12abc']).to eq ['http://www.farmdrop.com', 1]
    end
  end

  describe '#check_protocol' do
    it 'adds protocol if none included in request' do
      new_entry = URLEntry.new('www.farmdrop.com')
      expect(new_entry.url).to eq 'http://www.farmdrop.com'
    end

    it 'does not add protocol if already given' do
      new_entry = URLEntry.new('http://www.farmdrop.com')
      expect(new_entry.url).to eq 'http://www.farmdrop.com'
    end
  end

  describe '#counter' do
    it 'adds to the url counter each time a short url is visited' do
      allow(url_entry).to receive(:short_url) { '12abc' }
      url_entry.json_response
      expect(URLEntry.data['12abc']).to eq ['http://www.farmdrop.com', 0]
    end
  end
end
