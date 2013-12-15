# Modeling a public library with object oriented Ruby for Code Fellows!

class Library
	attr_reader :shelf, :books #The library should be aware of a number of shelves.	
	def initialize
		@shelf = []
		@books = []
	end

	def report_all # The library should have a method to report all books it contains.
		puts "Currently in the library we have #{Book.total} books."
	end

	def add_shelf(shelf)
		@shelf.push(self)
  end
end

class Shelf 
	attr_reader :books #Each shelf should know what books it contains.
  def initialize(library)
    library.add_shelf(self)
    @books = []
  end

  def check_out(book)
  	@books.delete(book)
  	$count += -1
  end

  def return(book)
    @books.push(book) 
  end
end

class Book #Make the book object have "enshelf" and "unshelf" methods that control what shelf the book is sitting on.
	attr_reader :shelf, :name

		$count = 0

	def initialize(name, library)
		@name = name
    @library = library
    $count += 1
  end

	def enshelf(shelf)
		@shelf = shelf
		shelf.return(self)
		puts "Thanks for returning!"
	end

	def unshelf
		@shelf.check_out(self)
		puts "Checking out #{(self)}..."
	end

	def self.total
		$count
	end
end

# COMMANDS =====

# Utah = Library.new
# Fantasy = Shelf.new(Utah)
# Programming = Shelf.new(Utah)
# Biography = Shelf.new(Utah)
# dragons = Book.new("Dragons!", Utah)
# rubywow = Book.new("Ruby!Wow!", Utah)
# george = Book.new("The Life of George", Utah)
# dragons.enshelf(Fantasy)
# george.enshelf(Biography)
# rubywow.enshelf(Programming)
# Utah.report_all
# dragons.unshelf
# rubywow.unshelf
# Utah.report_all