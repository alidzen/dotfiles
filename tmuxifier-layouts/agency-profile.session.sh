# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/projects/agency-directory-profile"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "agency-profile"; then
	load_window "agency-profile"

	# Select the default active window on session creation.
	#select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session