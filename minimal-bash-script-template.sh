#! /usr/bin/env bash

MINIMAL=0
VERBOSE=0

# -------------------------------------------------------------------

print_help()
{	
cat << EOF
Usage: minimal-bash-script-template [OPTIONS]

  Options:
    -m      --minimal    Minimal mode
    -v      --verbose    Verbose mode
    -h, -?, --help       Print usage instructions
EOF
}

print_ascii() 
{ 
cat << EOF
     ________________________________         
    /                                "-_          
   /      .  |  .                       \          
  /      : \ | / :                       \         
 /        '-___-'                         \      
/_________________________________________ \      
     _______| |________________________--""-L 
    /       F J                              \ 
   /       F   J                              L
  /      :'     ':                            F
 /        '-___-'                            / 
/_________________________________________--"  

EOF
}

print_sep() { printf "%*s\n" 60 | tr ' ' '-' ; }

print_log() { printf "\e[m[\e[%dm%c\e[m] %s\n" "$@" ; }

log()
{
	case $2 in
		0) print_log 31 '-' "$1" ;;
		1) print_log 32 '+' "$1" ;;
		2) print_log 33 '!' "$1" ;;
		*) print_log 0  '*' "$1" ;;
	esac
}

eval_args()
{
	for arg in $@
	do
		case $arg in
			-h|-\?|--help) print_help ; exit ;;

			-m|--minimal) MINIMAL=1 ;;
			-v|--verbose) VERBOSE=1 ;;
		esac
	done
}

# -------------------------------------------------------------------

eval_args $@

# Example

print_ascii

log "Error" 0
log "Success" 1
log "Warning" 2
log "Information"

echo

print_sep

echo

echo "Logging example: "

echo

log "Could not establish connection to node" 0
log "Compilation complete — total time: 00:01:17" 1
log "Low battery life" 2
log "Extracting buffer..."
log "Buffer extracted: " 1

cat << EOF
	
	0x65 0x6e 0x67 0x69 0x6e 0x65 
	0x65 0x72 0x2d 0x39 0x39 0x62

	0x32 0x30 0x32 0x30

EOF

read -p ">>> " message

echo

log "Message received: $message" 1

echo

log "Exiting..."

echo
