# Butler replacement
We depart from the SARAH standard and
will installed SARAH Toolbox directly in the primary
directory.

## Copy the created and generated files in an brigde directory (`BSM`)

1) We do not need to explicitly execute the ./configure to have all the sources because they are already included as GitHub submodules (see below). However note that some of them are disbled. We used:
```bash
 $ ./configure --disable-whizard --disable-higgsbounds --disable-higgssignals
```
2) Symbolic links were removed and now they are real directories with the GitHub submodules, which have tags for the release versions.
3) Afer the recursive clone (check [README.md](README.md)) you
   need to create a branch for a model (new or any of SARAH's Models) according to the standards in [README.md](README.md)
 ```bash
 $ git branch CATEGORY+MODEL
 $ git checkout CATEGORY+MODEL
 ```
4) To run SARAH, generate the output of the several tools, and copy the output into the right tool directory, run either 
```
./butler CATEGORY/MODEL
```
or just (the model is infered from the branch name):
```bash
 $ ./install.sh --butler
```
5) We decide to use the official tools releases without modifications or additions. In this way, we store the created and generated files in the `BSM` directory for fast reinstallation.  
   * For the created SARAH model files,  it is necessary to copy the model folder in  `BSM/SARAH/Models`.
   * After a succesfull  butler run, the generated files for each tool can be copied automatically into the `BSM` folder by going into the BSM and run
```bash
 $ ./output.sh
```
6) Add the created directories to the repository branch and make the corresponding commit and pull request.

## Fast installation
In a clean cloned copy of the repository branch `CATEGORY+MODEL`,  Mathematica is not longer needed. To have the required files and make the compiation of all tools, just use
```bash
  $ ./install.sh
```
This can be used as a faster replacment of butler. To make the full test, it is recommended to work in a  clean cloned repository, or after clean the first `butler` generated code and executables with the coomand
```bash
  $ ./install.sh --clean
```


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

# Deprecated instructions


* Update clean.sh and update and execute clean_repo.sh
* To avoid clutter the repo with binary files, please execute from the main Toolbox dir

```bash
  ./butler CATEGORY/MODEL
  cd micromegas/CATEGORYMODEL
  make clean
  cd ../../
  git add SPHENO/CATEGORYMODEL
  git add micromegas/CATEGORYMODEL
  #Be sure to include so_generated dir
  git add micromegas/SimplifiedDMSDFDM/work/so_generated/
``` 

* Rebuild micromegas binaries

```bash
  cd micromegas/CATEGORYMODEL
  make main=CalcOmega.cpp
  make main=CalcOmega_with_DDetection_MOv....cpp
``` 



