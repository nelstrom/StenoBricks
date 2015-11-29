require 'rspec'
require_relative '../lib/steno_brick_kit'

module StenoBrickKit
  describe 'Buttons' do
    it 'numberButton' do
      button = StenoBrickKit.numberButton.first
      expect(button[:shade]).to eql('dark')
      expect(button[:symbol]).to eql('#numberKeyPath')
      expect(button[:offset]).to eql(-0.5)
    end

    it 'starButton' do
      button = StenoBrickKit.starButton.first
      expect(button[:shade]).to eql('light')
      expect(button[:symbol]).to eql('#starKeyPath')
      expect(button[:offset]).to eql(4.5)
    end

    it 'thumbs' do
      first, _, _, last = StenoBrickKit.thumbs
      expect(first[:shade]).to eql('dark')
      expect(first[:symbol]).to eql('#thumbFirstPath')
      expect(first[:offset]).to eql(3.5)
      expect(last[:shade]).to eql('light')
      expect(last[:symbol]).to eql('#thumbSecondPath')
      expect(last[:offset]).to eql(6.5)
    end

    it 'leftBottom' do
      button = StenoBrickKit.leftBottom.first
      expect(button[:shade]).to eql('light')
      expect(button[:symbol]).to eql('#bottomRowPath')
      expect(button[:offset]).to eql(0)
    end

    it 'leftTop' do
      button = StenoBrickKit.leftTop.first
      expect(button[:shade]).to eql('dark')
      expect(button[:symbol]).to eql('#topRowPath')
      expect(button[:offset]).to eql(1)
    end

    it 'rightBottom' do
      button = StenoBrickKit.rightBottom.first
      expect(button[:shade]).to eql('light')
      expect(button[:symbol]).to eql('#bottomRowPath')
      expect(button[:offset]).to eql(7)
    end

    it 'rightTop' do
      button = StenoBrickKit.rightTop.first
      expect(button[:shade]).to eql('dark')
      expect(button[:symbol]).to eql('#topRowPath')
      expect(button[:offset]).to eql(7)
    end

  end
end
