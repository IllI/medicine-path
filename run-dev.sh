#!/bin/bash

echo -e "\e[32mStarting Medicine Path Development Environment\e[0m"
echo -e "\e[32m-----------------------------------\e[0m"
echo ""

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check for terminal multiplexers or open new terminals
if command_exists tmux; then
  echo "Using tmux to run development servers..."
  
  # Start a new tmux session if not already in one
  if [ -z "$TMUX" ]; then
    tmux new-session -d -s medicine-path
    tmux rename-window -t medicine-path:0 "Medicine Path Dev"
    
    # Create panes for each app
    tmux split-window -h -t medicine-path:0
    
    # Run Next.js in first pane
    tmux send-keys -t medicine-path:0.0 "cd app && npm run dev" C-m
    
    # Run Sanity in second pane
    tmux send-keys -t medicine-path:0.1 "cd sanity && npm run dev" C-m
    
    # Attach to the tmux session
    tmux attach -t medicine-path
  else
    # Already in tmux, just create new windows
    tmux new-window -n "Next.js" "cd app && npm run dev"
    tmux new-window -n "Sanity" "cd sanity && npm run dev"
  fi
else
  # Fallback to running in separate terminals if possible
  if command_exists gnome-terminal; then
    gnome-terminal -- bash -c "cd app && npm run dev; exec bash"
    gnome-terminal -- bash -c "cd sanity && npm run dev; exec bash"
  elif command_exists xterm; then
    xterm -e "cd app && npm run dev" &
    xterm -e "cd sanity && npm run dev" &
  else
    echo -e "\e[33mCouldn't find a way to open multiple terminals.\e[0m"
    echo -e "\e[33mPlease run the servers manually in separate terminals:\e[0m"
    echo ""
    echo -e "Terminal 1: \e[34mcd app && npm run dev\e[0m"
    echo -e "Terminal 2: \e[34mcd sanity && npm run dev\e[0m"
    exit 1
  fi
fi

echo ""
echo -e "\e[32mDevelopment servers started:\e[0m"
echo -e "\e[36m- Next.js: http://localhost:3000\e[0m"
echo -e "\e[33m- Sanity: http://localhost:3333\e[0m"
echo ""
echo -e "\e[90mNote: Close the terminal windows to stop the servers\e[0m" 