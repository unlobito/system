# dirchanger - a ZSH function to navigate and setup repositories based on URLs or path segments

dirchanger() {
    # Function to extract the first two segments of the path from the URL, Git path, or direct path segment
    extract_path_from_url() {
        local input=$1
        local urlpath

        if [[ "$input" == http* ]]; then
            # For HTTP/HTTPS URLs, extract the path after the domain
            urlpath="${input#*://*/}"
        elif [[ "$input" == git@* ]]; then
            # For Git-style paths, strip the prefix up to the colon
            urlpath="${input#*:}"
        elif [[ "$input" == */* ]]; then
            # Direct path segment
            urlpath="$input"
        else
            echo "Unsupported format"
            return 3
        fi

        # Get the first two segments of the path, removing any potential .git suffix
        urlpath=$(echo "$urlpath" | cut -d'/' -f1,2 | sed 's/\.git$//')
        echo "$urlpath"
    }

    # Check if an argument is provided
    if [[ -z "$1" ]]; then
        echo "Usage: dirchanger <URL or Git path or path segment>"
        return 1
    fi

    # Extract the path from the provided input
    local urlpath=$(extract_path_from_url "$1")

    # Construct the local directory path
    local local_dir="$HOME/w/$urlpath"

    # Check if the directory exists
    if [[ ! -d "$local_dir" ]]; then
        echo "Directory does not exist, creating: $local_dir"
        mkdir -p "$local_dir"
        local git_clone_url
        if [[ "$1" == git@* ]]; then
            # Assume Git path is provided for cloning
            git_clone_url="$1"
        else
            # Modify this line as necessary to form a proper Git URL for other inputs
            git_clone_url="git@github.skyscannertools.net:${urlpath}.git"
        fi
        echo "Cloning $git_clone_url into $local_dir"
        git clone "$git_clone_url" "$local_dir"
    fi

    # Change directory
    cd "$local_dir"
}

# Optionally, add an alias for easier use
alias cds='dirchanger'
