require_relative 'FindKey'
require_relative 'Decipher'

def chunk(string, size)
    string.scan(/.{1,#{size}}/)
end

def main

  print "Enter your ciphertext: "
  name = gets.chomp
  name = criptograma 

  salida = findKey(criptograma)
  clave_final = salida[:clave]

  elementos_columna = (criptograma.length*1.0/clave_final*1.0).ceil

  subcadenas_aux = chunk(criptograma, elementos_columna)
  subcadenas_fin = []
  8.times do |c|
    subcad = ''
    elementos_columna.times do |f|
      subcad += criptograma[c + clave_final*f].nil? ? '': criptograma[c + clave_final*f]
    end
    subcadenas_fin.push(subcad)
  end

  subcadenas_texto_plano = []
  for cadena in subcadenas_fin do
      subcadenas_texto_plano << decipher(cadena)
  end

  puts subcadenas_texto_plano[0].length
  texto_plano = ""
  subcadenas_texto_plano[0].length.times do |i|
    subcadenas_texto_plano.each do |subcadena|
      texto_plano += subcadena[i].nil? ? '' : subcadena[i]
    end
  end

  puts texto_plano

end

main
