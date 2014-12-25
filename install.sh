git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
go get -u github.com/nsf/gocode
go get -u github.com/jstemmer/gotags
mkdir -p $HOME/.vim/ftdetect
mkdir -p $HOME/.vim/syntax
mkdir -p $HOME/.vim/autoload/go
ln -s $GOROOT/misc/vim/ftdetect/gofiletype.vim $HOME/.vim/ftdetect/
ln -s $GOROOT/misc/vim/autoload/go/complete.vim $HOME/.vim/autoload/go
