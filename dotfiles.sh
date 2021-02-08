cd ../dotfiles

# Copy dotfiles to the $HOME directory
for file in *; do
    ln -nf "$file" ~/."$file"
done

cd -

# Reload bash_profile
source ~/.bash_profile