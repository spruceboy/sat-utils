#!/bin/env  ruby

ARGV.each do |x|
	case (x.split(".").last)
		when "gz"
			system("gunzip", x)
			x = File.basename(x, ".gz")
		when "bz2"
			system("bunzip2", x)
                	x = File.basename(x, ".bz2")
		when "zero"
			#do nothing
			x = File.basename(x)
	end

	case (x.split(".").first)
		when "t1"
			system("/opt/modis/rt-stps/bin/batch.sh /opt/modis/rt-stps/config/terra.xml ./#{x}")
		when "a1"
			puts("Not implemented yet..")
			exit
	end
end
