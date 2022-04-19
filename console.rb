require_relative './classes/item'
require_relative './classes/game'

item = Game.new('2000-04-12', true, '2022-04-20')

p item.can_be_archived?