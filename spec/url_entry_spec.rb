# frozen_string_literal: true

require 'url_entry'

describe URLEntry do
  let(:url_entry) { described_class.new('www.farmdrop.com') }

  describe '#short_url' do
    it 'generates a string with 5 characters' do
      expect(url_entry.short_url.length).to eq 5
    end

    it 'each string is unique' do
      short_url_1 = url_entry.short_url
      short_url_2 = url_entry.short_url
      expect(short_url_1).not_to equal short_url_2
    end
  end

  describe '#json_response' do
    it 'returns data in the correct format' do
      allow(url_entry).to receive(:short_url) { '12abc' }
      expect(url_entry.json_response).to eq '{"short_url":"12abc","url":"www.farmdrop.com"}'
    end

    it 'saves entry to data hash' do
      allow(url_entry).to receive(:short_url) { '12abc' }
      url_entry.json_response
      expect(URLEntry.data["12abc"]).to eq "www.farmdrop.com"
    end
  end

  describe '#self.retrieve' do
    it 'given a short url string, it finds the full url' do
      allow(url_entry).to receive(:short_url) { '12abc' }
      url_entry.json_response
      expect(URLEntry.retrieve('12abc')).to eq "www.farmdrop.com"
    end
  end

end
