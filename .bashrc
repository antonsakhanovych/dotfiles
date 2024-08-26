DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Source everything from ~/.settings
for file in $(find ~/.settings -type f -o -type l); do
    . $file
done

# call starship prompt
eval "$(starship init bash)"
