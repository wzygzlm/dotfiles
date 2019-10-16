This guide is used to clean big files in the git repo history.

gitlistobjectbysize.sh is a script to list all the objects in the repo by sie. It is very easy to use. Simply run ./gitlistobjectbysize.sh in the desired folder. 
bfg is a tool to remove this big objects by size or by name.

Download BFG:
cd
wget https://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar

run it to clean the big file by size, e.g. to clean dotfiles:
java -jar bfg.jar --strip-blobs-bigger-than 5M ./dotfiles
cd dotfiles
git reflog expire --expire=now --all && git gc --prune=now --aggressive
Done!

More details about BFG, please google it or refer to https://rtyley.github.io/bfg-repo-cleaner/
