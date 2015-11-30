Write-Host "Setting Up Config Files"
if (!(Test-Path $HOME\vimfiles)) {
    md $HOME\vimfiles
}
if (!(Test-Path $HOME\vimfiles\autoload)) {
    md $HOME\vimfiles\autoload
}
if (!(Test-Path $HOME\vimfiles\bundle)) {
    md $HOME\vimfiles\bundle
}
wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -OutFile $HOME\vimfiles\autoload\pathogen.vim
if (!(Test-Path $HOME\vimfiles\bundle\vim-ps1)) {
    git clone https://github.com/PProvost/vim-ps1.git $HOME\vimfiles\bundle\vim-ps1
}

if (!(Test-Path $HOME\vimfiles\bundle\typescript-vim)) {
    git clone https://github.com/leafgarland/typescript-vim.git $HOME\vimfiles\bundle\typescript-vim
}
copy $PSScriptRoot\vimrc $HOME\_vimrc
Write-Host "Done"
