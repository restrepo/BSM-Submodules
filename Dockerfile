# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
# https://github.com/jupyter/docker-stacks
# https://mybinder.org/v2/gh/restrepo/bsm-submodules/master

FROM jupyter/scipy-notebook



#My packages
USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-setuptools python3-dev build-essential gfortran&& \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN easy_install pip
RUN pip install pyslha bash_kernel
RUN python -m bash_kernel.install

USER $NB_USER

#RUN conda create -n ipykernel_py2 python=2 ipykernel --yes
#RUN source activate ipykernel_py2    # On Windows, remove the word 'source'
#RUN python -m ipykernel install --user


# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}

USER root
RUN chown -R ${NB_UID} ${HOME}
#RUN python2 -m pip install ipykernel

USER ${NB_USER}


