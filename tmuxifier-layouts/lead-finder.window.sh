# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/projects/lead-finder/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
#
#
new_window "terminal"

new_window "client"
run_cmd "cd ~/projects/lead-finder/client/"
run_cmd "sleep 15"
run_cmd "npm run dev:ts-check"

new_window "server"
run_cmd "SPRING_PROFILES_ACTIVE=dev ./gradlew :server:app-api:clean :server:app-api:build :server:app-api:bootRun -x test"

new_window "server QuickPurchuase"
run_cmd "cd ~/projects/agency-directory/"
run_cmd "git checkout master"
run_cmd "git pull"
run_cmd "SPRING_PROFILES_ACTIVE=dev ./gradlew :server:app-api:clean :server:app-api:build :server:app-api:bootRun -x test"

select_window "terminal"

#split_h 50

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
#select_pane 0
