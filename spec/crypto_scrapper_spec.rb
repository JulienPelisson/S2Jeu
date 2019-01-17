# frozen_string_literal: true

require_relative '../lib/crypto_scrapper'

describe 'the scypto_scrapper method' do
  it 'should return a hash' do
    expect(crypto_scrapper).is_a?(Hash)
  end

  it 'should return a name money and a non nul value' do
    expect(crypto_scrapper).not_to be_nil
  end
end
