# encoding: utf-8

# In dem (automatisch befüllten) Array ARGV ist an der ersten Stelle 
# (also in ARGV[0]) der an der Kommandozeile übergebene Dateiname eingefügt,
# bei "ruby kanji_statistics.rb inugami.txt" wäre ARGV[0] also "inugami.txt". 
# Diese Datei öffnen wir und laden ihren Inhalt in die Variable namens "text"

text = open(ARGV[0]).read

# Hier definieren wir einen regulären Ausdruck für Kanji. Ich hoffe es 
# erinnern sich noch alle wie er funktioniert.
kanji_regex = /[一-鿃]/

# Nun machen wir einen Hash (also eine Liste mit Schlüssel/Wert-Paaren) in dem
# wir unsere Kanji zählen wollen. Durch die 0 in "Hash.new(0)" wird jedem 
# nicht explizit gesetzten Schlüssel der Wert 0 zugewiesen.
kanji_hash = Hash.new(0)

# Jetzt gehen wir jedes einzelne Zeichen des Textes durch. Dafür gibt es die
# Methode "each_char", kurz für "each character" ("jedes Zeichen"). Wenn ihr
# wissen wollt, was man sonst noch mit Zeichenketten (engl. "Strings") machen
# kann, schaut euch http://ruby-doc.org/core/classes/String.html an.

# Diese Prozedur führt den Code zwischen "do" und "end" für jedes einzelne
# Zeichen in "text" aus. Das Zeichen wird dabei jeweils in die Variable
# "aktuelles_zeichen" geschrieben. Dieser Variablenname ist frei wählbar, ihr
# könnt ihn ruhig ändern (dann aber überall wo er vorkommt).

text.each_char do |aktuelles_zeichen|

  # Mit dem Befehl "puts" können Zeichen auf dem Bildschirm ausgegeben werden.
  # wir geben das aktuelle Zeichen aus, aber nur WENN es auf den kanji_regex
  # passt (dafür ist der "=~" Befehl gut), also ein Kanji ist.
  puts aktuelles_zeichen if aktuelles_zeichen =~ kanji_regex

  # Hier müssst ihr jetzt selber etwas in die Punkte einsetzen. Die Lösung
  # findet ihr im Tutorial auf tryruby.org. Denkt daran die Raute vor der 
  # nächsten Zeile zu entfernen, sonst wird sie von Ruby ignoriert! Denkt
  # auch daran nur die Kanji zu zählen!

  # kanji_hash[...] = ...

end

# Zum Schluss geben wir den ganzen Kanji-Hash aus, in dem sich nun (wenn ihr 
# das Programm fertiggestellt habt) die Kanji des Textes mit ihrer Häufigkeit
# befinden. Viel Erfolg!
puts kanji_hash
