# Butler replacement
We depart from the SARAH standard and
will install SARAH Toolbox directly in the primary
directory.

1) We need to explicitly execute the ./configure to have all the sources.
   However note that some of them are disbled:
```bash
 $ ./configure --disable-whizard --disable-higgsbounds --disable-higgssignals
```
2) Symbolic links were removed and now are real directories with the github submodules
```bash
 $ rm link
 $ mv real_name link
```
3) Afer the recursive clone (check [README.md](README.md)) you
   need to create a branch for a model (new or any of SARAH's Models)
 ```bash
 $ git branch NEW+BRANCH
 $ git checkout NEW+BRANCH
 ```
If the Model is new, put the model files under BSM/SARAH/Models
4) Run
```bash
 $ ./install --butler
```
to creates the MODEL dirs
4) Go to BSM and run
```bash
 $ ./output.sh
```
After a successful run, add the resulting directories created to the repository:
```bash
 $ git add SARAH SPHENO madgraph calchep micromegas
```
5) Make the commit and push into NEW+BRANCH. After a fresh version of the branch
you can run directly 
```bash
  $ ./install
```
as a faster replacment of butler

# Further details:

To update to a new version X.X.X of some of tarballs, simply cd into the root dir where the tool is located and execute:
```bash
  $ tar -zxvf tarball.X.X.X.tar.gz -C tool_DIR --strip-components=1
```

Recompile the tool accordingly.

Make the commit by incluging the the new version in the commit message:
```bash
 $ git commit -a -m "toolbox X.X.X"
 $ git tag X.X.X COMMIT_HASH
 ```
 
 Finally we push into the remote server including the tags:
 ```bash
  $ git push origin master --tags
```