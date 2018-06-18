We depart from the SARAH standard and
will install SARAH Toolbox directly in the primary
directory.

1) We need to explicitly execute the ./configure to have all the sources.
   However note that some of them are disbled:

 $ ./configure --disable-whizard --disable-higgsbounds --disable-higgssignals

2) Symbolic links were removed and real directories were as github submodules
 $ rm link
 $ mv real_name link

3) Afer the recursive clone (check README.md) you
   need to create a branch for a model (new or any of SARAH's Models)
   

 $ git branch NEW+BRANCH
 $ git checkout NEW+BRANCH

If the Model is new, put the model files under BSM/SARAH/Models

4) Run

 $ ./install --butler

to creates the MODEL dirs

4) Go to BSM and run

 $ ./output.sh

 Aftee a successful run, add the resulting directories to the repository:

 $ git add SARAH SPHENO madgraph calchep micromegas
 
5) Make the commit and push into NEW+BRANCH. After a fresh version of the branch
you can run directly 

  $ ./install

as a faster replacmente of butler

Other details:

To update to a new version X.X.X of some of tarballs, simply cd to the root dir where the tool is located

  $ tar -zxvf tarball.X.X.X.tar.gz -C tool_DIR --strip-components=1

Recompile the tool accordingly.

commit with the new version in the message:

 $ git commit -a -m "toolbox X.X.X"
 $ git tag X.X.X COMMIT_HASH
 
 Finally we push into the remote server including the tags:
 
  $ git push origin master --tags