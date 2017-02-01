# Opens the file and splits each row into an array.
sudokou_solver = File.foreach('ruby.txt').map {|line| line.split(' ')}
row_one = sudokou_solver[0]
row_two = sudokou_solver[1]
row_three = sudokou_solver[2]
column_one = sudokou_solver.transpose[0]
column_two = sudokou_solver.transpose[1]
column_three = sudokou_solver.transpose[2]
if row_one.map(&:to_i).reduce(:+) != 15
  print "Check the first row dude, they need to add up to 15."
elsif row_two.map(&:to_f).reduce(:+) != 15
  print "Check the second row dude, they need to add up to 15."
elsif row_three.map(&:to_f).reduce(:+) != 15
  print "Check the third row dude, they need to add up to 15."
elsif column_one.map(&:to_f).reduce(:+) != 15
  print "Check the first column man, they need to add up to 15."
elsif column_two.map(&:to_f).reduce(:+) != 15
  print "Check the second column man, they need to add up to 15."
elsif column_three.map(&:to_f).reduce(:+) != 15
  print "Check the second column man, they need to add up to 15."
else
  print "Congrats man! You solved a 3 by 3 Sudokou puzzle."
end
