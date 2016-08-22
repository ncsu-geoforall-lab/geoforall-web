NCSU GeoForAll Lab web site
===========================

This is a repository with web pages for NCSU GeoForAll Lab which are
placed at http://gis.ncsu.edu/osgeorel/.


Repository structure
--------------------

HTML files are placed at the top level, images and files for download
are placed inside subdirectories.

HTML files are not full HTML pages (i.e. valid HTML documents).
Pages are build using a script. There are files with header and footer
which will prepended and appended to all other HTML files.
These files should be listed in the script ``build-pages.sh``.

For pages, images and other files in repository, use only relative links
to be able to view pages locally or on different server.


Using repository and building pages
-----------------------------------

Clone (download) the repository::

    git clone https://github.ncsu.edu/osgeorel/osgeorel-web.git

Enter unityid and unitypassword.

Repository is downloaded into ``osgeorel-web`` directory.

Now you can go to the ``osgeorel-web`` directory and make your changes::

    cd osgeorel-web

Make changes.

Build web pages once you want to see them::

    ./build-pages.sh

The built pages are in ``build`` subdirectory.

Commit you changes (save them in local repository) and push them into
the remote repository (NCSU GitHub)::

    git commit -am "changes in this and that"
    git push

If you don't have public SSH key of your local computer in NCSU GitHub,
you need to enter your unityid and unitypassword. Note that you can do
several commits and then push them all together.


Publishing pages by building on server and using Git
----------------------------------------------------

If you are doing this for the first time connect to server using SSH
and create necessary directories and clone the repository::

    cd ~
    git clone git@github.ncsu.edu:osgeorel/osgeorel-web.git

You will be asked if you want to add the NCSU GitHub server to the list
of trusted severs (using fingerprint). Now you are prepared to use
the update and build script from your local machine.

Since then just use from your local machine::

    ./build-on-server.sh yourusername

Run these scripts on your local machine. You will be asked to
enter your password for the server and for the unityid and password
to authenticate download from NCSU GitHub.

Note that this method ensures consistency because only committed changes
will be published and you cannot publish your changes without merging
with changes of other contributors (in other words, you cannot overwrite
their published changes). It will also ensure that you include all files
in the repository.

These scripts use Git SSH access and you need to use SSH key to
connect to NCSU GitHub from the server. So, you need to create a SSH key
on the server first.


Creating SSH key
----------------

If you want SSH key to connect from the server to NCSU GitHub, connect
to server using SSH. These steps should work the same for sever or your
local machine.

Go to `.shh` directory::

    cd ~/.shh

Check whether you have a key already using `ls` the file names would be
something like `id_rsa.pub` and `id_rsa`. If you don't have any,
generate one::

    ssh-keygen -t rsa -C "yourunityid@ncsu.edu"

It is enough if you use the default file name and enter the empty (no)
password.

Then see the public key::

    cat id_rsa.pub

And copy the whole file contents to clipboard. The go to SHH settings
on NCSU GitHub at https://github.ncsu.edu/settings/ssh and add a key.
Put the whole content of `id_rsa.pub` file to *key* field. Fill *title*
with the name you are used to use for the sever just to know which key
it is.

The longer and complete guide (including setting the password for SSH key)
is available at https://help.github.com/articles/generating-ssh-keys.


Publishing pages by copying built pages to server (obsolete)
------------------------------------------------------------

Upload pages to the afs space. The script will use your server home directory
to store compressed pages and will uncompress them and copy them to www
directory::

    ./copy-to-server.sh yourusername

See the server details in the ``copy-to-server.sh`` script.

To update your local repository with changes done by other people, use::

    git pull

This requires unityid and password, too. There is also a possibility to
register you public key in NCSU GitHub.


Making changes
--------------

If you just edit a file, you don't need to do anything else besides
commit to tell git about it. However, if you rename, add or delete
a file, you need to tell git about it. For example::

    git mv your_old_file_name.txt your_new_file_name.txt
    git add your_new_file.txt
    git rm your_file_to_delete.txt

Note that these commands will do the change, so don't do the change
manually but you these git commands instead.

You can review changes before you commit them using::

    git diff

If you like using aliases, you may use following command which will add
an alias for a colorful diff command into your ``.gitconfig`` file.

::

    git config --global alias.df 'diff --color=auto'
