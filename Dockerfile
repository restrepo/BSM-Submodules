# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
# https://github.com/jupyter/docker-stacks
# https://mybinder.org/v2/gh/restrepo/bsm-submodules/master

FROM jupyter/scipy-notebook



#My packages
USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



USER $NB_USER

RUN conda install --quiet --yes bash_kernel



# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}

USER root
RUN chown -R ${NB_UID}:${NB_UID} ${HOME}
#RUN python2 -m pip install ipykernel

USER ${NB_USER}


