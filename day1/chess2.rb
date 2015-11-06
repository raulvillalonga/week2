require 'pry'
class Board
	attr_accessor :grid 
	def initialize
		@grid = Array.new (8){Array.new (8){nil}}
	end

	def put_piece(piece, position_v, position_h)
		@grid[position_v][position_h] = piece
	end

	def mostrar_class(position_v, position_h)
		@grid[position_v][position_h].class
	end

end

class Piece
	attr_accessor :position_v, :position_h
	def initialize(position_v, position_h, is_black)
		@position_v = position_v
		@position_h = position_h
		@first_mov = true
		@color_b = is_black		
	end

	def mostrar
		puts "v#{@position_v} h#{@position_h}"
	end
end

class Torre < Piece
	def posicion_posible?(pos_next_v, pos_next_h)
		posible = false
		posible = se_puede_llegar?(pos_next_v, pos_next_h)
		#posible = camino_posible

		if posible
			puts "LEGAL"
		else
			puts "ILEGAL"
		end
	end

	def se_puede_llegar?(pos_next_v, pos_next_h)
		#binding.pry
		if (@position_v != pos_next_v)&&(@position_h == pos_next_h)
			return true
		end
		if (@position_v == pos_next_v)&&(@position_h != pos_next_h)
			return true
		end
		return false
	end

	def camino_posible
		return true
	end
end



class Peon < Piece
	def posicion_posible?(pos_next_v, pos_next_h)
		posible = false
		posible = se_puede_llegar?(pos_next_v, pos_next_h)
		#posible = camino_posible

		if posible
			puts "LEGAL"
		else
			puts "ILEGAL"
		end
	end

	def se_puede_llegar?(pos_next_v, pos_next_h)
		binding.pry
		if ((@position_v - pos_next_v) == -1)&&(@position_h == pos_next_h)&&@color_b
			return true
		end
		if ((@position_v - pos_next_v) == 1)&&(@position_h == pos_next_h)&&!@color_b
			return true
		end
		if ((@position_v - pos_next_v) == -1)&&(@position_h == pos_next_h)&&@color_b&&@first_mov
			return true
		end
		if ((@position_v - pos_next_v) == 1)&&(@position_h == pos_next_h)&&!@color_b&&@first_mov
			return true
		end
		return false
	end

	def camino_posible
		return true
	end
end

class Alfil < Piece
	def posicion_posible?(pos_next_v, pos_next_h)
		posible = false
		posible = se_puede_llegar?(pos_next_v, pos_next_h)
		#posible = camino_posible

		if posible
			puts "LEGAL"
		else
			puts "ILEGAL"
		end
	end

	def se_puede_llegar?(pos_next_v, pos_next_h)
		#binding.pry
		if ((@position_v - pos_next_v).abs - (@position_h - pos_next_h).abs) == 0
			return true
		end
		return false
	end

	def camino_posible
		return true
	end
end


class Reina < Piece
	def posicion_posible?(pos_next_v, pos_next_h)
		posible = false
		posible = se_puede_llegar?(pos_next_v, pos_next_h)
		#posible = camino_posible

		if posible
			puts "LEGAL"
		else
			puts "ILEGAL"
		end
	end

	def se_puede_llegar?(pos_next_v, pos_next_h)
		#binding.pry
		if ((@position_v - pos_next_v).abs - (@position_h - pos_next_h).abs) == 0
			return true
		end
		if (@position_v != pos_next_v)&&(@position_h == pos_next_h)
			return true
		end
		if (@position_v == pos_next_v)&&(@position_h != pos_next_h)
			return true
		end
		return false
	end

	def camino_posible
		return true
	end
end

class Reina < Piece
	def posicion_posible?(pos_next_v, pos_next_h)
		posible = false
		posible = se_puede_llegar?(pos_next_v, pos_next_h)
		#posible = camino_posible

		if posible
			puts "LEGAL"
		else
			puts "ILEGAL"
		end
	end

	def se_puede_llegar?(pos_next_v, pos_next_h)
		#binding.pry
		if ((@position_v - pos_next_v).abs - (@position_h - pos_next_h).abs) == 0
			return true
		end
		if (@position_v != pos_next_v)&&(@position_h == pos_next_h)&&((@position_v - pos_next_v).abs == 1||(@position_h = pos_next_h).abs == 1)
			return true
		end
		if (@position_v == pos_next_v)&&(@position_h != pos_next_h)&&((@position_v - pos_next_v).abs == 1||(@position_h = pos_next_h).abs == 1)
			return true
		end
		return false
	end

	def camino_posible
		return true
	end
end



class Validator
	def self.validar(pos_act_v,pos_act_h, pos_next_v, pos_next_h)
		permitido = true

		next_empty?(pos_act_v,pos_act_h, pos_next_v, pos_next_h)
		if !permitido
			return permitido
		end
		next_in_range?(pos_act_v,pos_act_h, pos_next_v, pos_next_h)
		if !permitido
			return permitido
		end
	end

	def next_empty?(pos_next_v, pos_next_h,tablero)
		tablero[pos_next_v][pos_next_h] == nil
	end

	def next_in_range?(pos_next_v, pos_next_h)
		if (pos_next_v < 0 || pos_next_v > 7 || pos_next_h < 0 || pos_next_h > 7)
			return false
		end
	end
end

=begin
tablero = Board.new

torre1 = Torre.new(4,4,true)
tablero.put_piece(torre1, torre1.position_v, torre1.position_h)
torre1.posicion_posible?(4,3)
torre1.posicion_posible?(2,1)

alfil1 = Alfil.new(4,4, true)
tablero.put_piece(alfil1, alfil1.position_v, alfil1.position_h)
alfil1.posicion_posible?(3, 5)
alfil1.posicion_posible?(4, 0)

reina1 = Reina.new(4,4, true)
tablero.put_piece(reina1, reina1.position_v, reina1.position_h)
reina1.posicion_posible?(7, 7)
reina1.posicion_posible?(0, 4)

peon1 = Peon.new(4,4, true)
tablero.put_piece(peon1, peon1.position_v, peon1.position_h)
peon1.posicion_posible?(7, 7)
peon1.posicion_posible?(0, 4) 

peon2 = Peon.new(4,4, false)
tablero.put_piece(peon2, peon2.position_v, peon2.position_h)
peon2.posicion_posible?(7, 7)
peon2.posicion_posible?(0, 4) 
=end

torre1 = Torre.new(4,4,true)
torre1.posicion_posible?(4,3)