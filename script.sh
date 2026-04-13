Structure of linux command

command -> subcommand ->options->arguments 


ls -a #List showing all the files (Use it if you want to write fast)
ls --all #Same commmand but with the extende option (--all = -a) {Use it if you dont sure dont know what the reduced command do}
#In Linux we have commands with the short or large option. 

ls -l #List files in long format (detailed information with permissions, size, date, etc.)
ls -h #Print file sizes in human-readable format (KB, MB, GB instead of bytes)
ls -l -a -h #Combination of three options: long format, show all files (including hidden), and human-readable sizes.
ls -l -ah #Combination of two options in one option.
ls -lah #The same as (-l -ah), but combine all the options in one option for the command ls.

mkdir -rf . #Cannot create a direcory named -rf cuz the command mkdir read the options -rf as options instead of a directory name. To create a directory named "-rf", you need to use the double dash "--" to indicate the end of options.
mkdir -- -rf 
rm -rf #This command is used to remove files or directories, with the options -r (recursive) and -f (force). This combination is valid for the rm command and will forcefully remove files or directories without prompting for confirmation.
rm -- -rf #This command is used to remove a file named "-rf". The double dash (--) is used to indicate the end of options, allowing you to specify a file name that starts with a hyphen (-) without it being interpreted as an option.
rmdir -- -rf #This command is used to remove a directory named "-rf". The double dash (--) is used to indicate the end of options, allowing you to specify a directory name that starts with a hyphen (-) without it being interpreted as an option.

git clone --depth 1 https://github.com/torvalds/linux.git 
#git clone for clone the GitHub repository, --depth 1 for shallow clone (only the lastest commit), and the URL of the reposity to be cloned. This command will create a local copy of the Linux repository on your machine (Instead of cloning the entire history of the repository).
ls --help #See the help information for the ls command, including a list of available options and their descriptions.
man ls #See the manual page for the ls command, which provides detailed information about its usage, options, and examples.

man git-clone #In the manual of git-clone use / and write depth to search for the option --depth in the manual page.
#Clones a repository into a newly created directory, creates remote-tracking branches for each branch in the cloned repository (visible using git branch --remotes),
and creates and checks out an initial branch that is forked from the cloned repository’s currently active branch.
- rwx r-x r-- # Permission for user, group, and others (read, write, execute)

chmod #Change mode, who, operator, permission, file
chmod +x script.sh #
chmod u+x script.sh #Add execute permission for the user (owner) of the file script.sh
chmod o-r script-sh #Remove read permission for others (users who are not the owner or in the group) on the file script.sh
chmod u+rw,go-rwx script.sh #Add read and write permissions for the user (owner) of the file script.sh, and remove all permissions for group and others on the file script.sh
