cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create \
symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    Echo "Creating symlink to $file

