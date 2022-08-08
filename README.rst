NCSU GeoForAll Lab web site
===========================

This is a repository with web pages for NCSU GeoForAll Lab.


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

Clone (download) the repository (HTTPS)::

    git clone https://github.com/ncsu-geoforall-lab/geoforall-web.git
    
Or with SSH::

    git clone git@github.com:ncsu-geoforall-lab/geoforall-web.git

Repository is downloaded into ``geoforall-web`` directory.

Now you can go to the ``geoforall-web`` directory and make your changes::

    cd geoforall-web

Make changes.

Build web pages once you want to see them::

    ./build-pages.sh

The built pages are in ``build`` subdirectory.

Commit you changes (save them in local repository) and push them into
the remote repository (NCSU GitHub)::

    git commit -am "changes in this and that"
    git push

Note that you can do several commits and then push them all together.
Once pushed, the website is deployed automatically.



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
