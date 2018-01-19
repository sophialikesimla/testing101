#to run this need to be in project direc then type 'rspec' voila
Sandwich = Struct.new(:taste, :toppings) #you’d put this kind of implementation logic into a separate file, typically in the lib directory

RSpec.describe 'An ideal sandwich' do #creates an example group (set of related tests)

#1 before{ @sandwich = Sandwich.new('delicious', []) } HOOK--> after adding this you can delete similiar codes below and replace sandwich with @sandwich

#2 def sandwich  HELPER METHODS
#	 @sandwich ||= Sandwich.new('delicious',[])
#  end

#3 SHARING OBJS WITH LET (RSpec will run the block the first time any example calls sandwich)
let(:sandwich) { Sandwich.new('delicious',[]) }

it 'is delicious' do #creates an example (individual test)
	#sandwich = Sandwich.new('delicious',[])
	taste = sandwich.taste
	expect(taste).to eq('delicious')#verifies an expected outcome (assertion)
end

it 'lets me add toppings' do
	#sandwich = Sandwich.new('delicious',[])
	sandwich.toppings << 'cheese'
	toppings = sandwich.toppings
	expect(toppings).not_to be_empty
end


end

#now you know three primary ways to reduce duplication(trim repetition ) in RSpec: hooks, helper methods, and let declarations