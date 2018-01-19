class Coffee #normally this is in another file tho(ofc!)
	def ingredients
		@ingredients ||= []
	end
	def add(ingredient)
		ingredients << ingredient
	end
	def price
		1.00 + ingredients.size * 0.25
	end
	def color
		ingredients.include?(:milk) ? :light : :dark
	end
	def temperature
		ingredients.include?(:milk) ? 190.0 : 205.0
	end
end

RSpec.configure do |conf| 
	conf.filter_run_when_matching(focus:true) #for 'fcontent' ->focus mode
	conf.example_status_persistence_file_path = 'spec/examples.txt' #to use 'rspec --only-failures'
end


RSpec.describe 'A cup of coffee' do
	let(:coffee) { Coffee.new }

	it 'costs $1' do
		expect(coffee.price).to eq(1.00)
	end
    #1 fcontext          #2 .. , focus:true do ...
	context 'with milk' do #context is just an alias for describe/the way “with milk” modifies “A cup of coffee.”
		before { coffee.add :milk }

		it 'costs $1.25' do
			expect(coffee.price).to eq(1.25)
		end
		#'xit' -> temporary annotation like fit except that it skips the example instead of focusing it == kinda 'pending'
		it 'is light in color' do
			# pending 'color not implemented yet'
			expect(coffee.color).to be(:light)
		end
		it 'is cooler than 200 degrees Fahrenheit' do 
			# pending 'temp not impplemented yet'
			expect(coffee.temperature).to be < 200.0
		end
	end


end