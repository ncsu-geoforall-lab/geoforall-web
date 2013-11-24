NCSU OSGeoREL web site
======================

This is a repository with web pages for NCSU OSGeoREL which are
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
Create additional directory for building pages named ``osgeorel``.
But go to the ``osgeorel-web`` where the repository content is.

::

    mkdir osgeorel
    cd osgeorel-web

Make changes.

Build web pages::

    ./build-pages.sh

Commit you changes (save them in local repository) and push them into
the remote repository (NCSU GitHub)::

    git commit -am "changes in this and that"
    git push

Enter unityid and unitypassword. Note that you can do several commits
and then push them all together.


Publishing pages
----------------

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
