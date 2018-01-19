
Toaster = Sturct.new(:serial) do
	def self.find_by_serial(serial)
		new(serial)
	end
end

def current_toaster
	@current_toaster ||= Toaster.find_by_serial('blabla')
end

current_toaster

@current_toaster = nil || Toaster.find_by_serial('blabla')