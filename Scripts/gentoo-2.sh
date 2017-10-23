#!/usr/bin/env ruby
# coding: utf-8
 
# ANSI color scheme script 
# Author: Ivaylo Kuzev < Ivo >
# Original: http://crunchbanglinux.org/forums/post/134749/#p134749
# Modified using Ruby.
 
CL = "\e[0m"
BO = "\e[1m"

R = "\e[31m" 
G = "\e[32m"
Y = "\e[33m"
B = "\e[34m"
P = "\e[35m"
C = "\e[36m"
  
print <<EOF 
 
	#{P}    ██████#{CL} #{P}  ██████#{CL}#{P} ██████  #{CL} #{P}████████#{CL}#{P}  ██████ #{CL}#{P}  ██████ #{CL}
	#{P}  ██      #{CL} #{P}██      #{CL} #{P}██   ███ #{CL} #{P}  ████  #{CL}#{P}████  ██#{CL} #{P}████  ██#{CL}
	 #{Y} ████   █#{CL}#{Y} ████    #{CL}#{Y} ██    ██#{CL} #{Y}   ██    #{CL}#{Y}███  ███#{CL} #{Y}███  ███#{CL}
	 #{Y}  ███████#{CL}#{Y} ████████#{CL}#{Y} ███  ███#{CL} #{Y}  ████   #{CL}#{Y} █████  #{CL} #{Y} █████  #{CL}

EOF
