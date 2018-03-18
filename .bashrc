	#
	# ~/.bashrc
	#
	
	# If not running interactively, don't do anything
	[[ $- != *i* ]] && return

	if [[ -f ~/.alias ]];then
        . ~/.alias
	fi	
