# General instructions
In master, after clone this repo
* See [GIT_MANAGEMENT.md](./GIT_MANAGEMENT.md) to build all the relevant tools of SARAH-Toolbox
* Create branch  `CATEGORY+MODEL` and checkout there:
```bash
  checkout CATEGORY+MODEL
```
* Creates the main SARAH file as

`SARAH/Models/CATEGORY/MODEL/CATEGORY-MODEL.m`
 
with: Model\`Name = "CATEGORYMODEL" inside `CATEGORY-MODEL.m`

## Further details.

* The jupyter notebook files `index_bash.ipynb` (`tests/CATEGORY-MODEL.ipynb`) must be updated (created).
* Update README.md mybinder button
* There is a script `micromegas_prtcl_fix.sh` to fix the `prtcl1.mdl` file if necessary (see http://goo.gl/n6Oypj)
* Commit the changes and make the pull request for the CATEGORY+MODEL branch



