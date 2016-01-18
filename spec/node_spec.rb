require 'spec_helper'
require 'letter_node'

describe LetterNode do


  let(:node) { LetterNode.new }


  # --------------------------------------------
  # #new
  # --------------------------------------------


  describe '#new' do

    it 'returns a LetterNode' do
      expect(node).to be_an_instance_of(LetterNode)
    end


    it 'returns a Struct' do
      expect(node).to be_a(Struct)
    end
  end


  # --------------------------------------------
  # Attributes
  # --------------------------------------------


  describe 'Attributes' do

    it 'responds to #letter' do
      expect(node).to respond_to(:letter)
    end


    it 'responds to #definition' do
      expect(node).to respond_to(:definition)
    end


    it 'responds to #children' do
      expect(node).to respond_to(:children)
    end


    it 'responds to #parent' do
      expect(node).to respond_to(:parent)
    end


    it 'responds to #depth' do
      expect(node).to respond_to(:depth)
    end

  end
end
